use RakuSH::Output;
use RakuSH::List;
use RakuSH::Utils;

unit class RakuSH::Proc;

has                @.cmd;
has Proc           $.proc;
has Bool           $.ok  = True;
has RakuSH::Output $.out;
has RakuSH::Output $.err;
has Bool           $.started = True;


method out {
    $!proc = run @!cmd, :out, :err unless $!started;
    .return with $!out;
    return Empty unless $!proc;
    my @data = $!proc.out.lines: :close;
    $!out = RakuSH::List.new: :@data if @data
}

method err {
    .return with $!err;
    return Empty unless $!proc;
    my @data = $!proc.err.lines: :close;
    $!err = RakuSH::List.new: :@data if @data;
}

method cmd-str {
    [
        grey("CMD:"),
        |@!cmd.map(&bold).join("\n").indent: 4
    ].join: "\n"
}

method gist {
    unless $!started {
        return run(@!cmd).gist;
    }
    [
        self.cmd-str,
        "",
        self.out.gist,
        (
            with self.err {
                |(
                    "ERRORS:",
                    .gist
                )
            }
        )
    ]
      .join("\n") ~ "\n"
}

method access(&block) {
    return self unless $!ok;
    block $.out;
}

method apply(Str $cmd, &block) {
    return self unless $!ok;
    my $res = block $.out;
    self.clone: :cmd[|@!cmd, $cmd], :out($res)
}
