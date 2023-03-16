use RakuSH::Output;
use RakuSH::List;
use RakuSH::Table;
use RakuSH::File;
use RakuSH::Proc;

unit class RakuSH;

has IO::Path() $.pwd  = ".".IO;
has IO::Path() @.path = %*ENV<PATH>.split: ":";
has            %.on-path;

method reload-path {
    %!on-path = @!path.reverse.map({ |.dir if .e && .d }).grep({ .x }).map({ .basename => $_ })
}

method TWEAK(|) { self.reload-path }

sub proc-to-list(Str @cmd, Proc $p) {
    my @data = $p.out.lines: :close;
    RakuSH::List.new: :@cmd, :@data
}

# multi method FALLBACK(Str $name where { %!on-path{$name}:exists }, :$flags) {
#     self.FALLBACK: $name, :flags[$flags, ]
# }
multi method FALLBACK(Str $name where { %!on-path{$name}:exists }, :@flags) {
    RakuSH::Proc.new: :cmd["$name :flags<@flags[]>"], :proc(run %!on-path{$name}, |@flags, :out, :err);
    # my $p = run %!on-path{$name}, |@flags, :out;
    # my @data = $p.out.lines: :close;
    # RakuSH::List.new: :cmd["$name :flags<@flags[]>"], :@data
}

# multi method FALLBACK(Str $name where { %!on-path{$name}:exists }, |c) {
#     say "exec: %!on-path{$name}.absolute()";
# }

# sub capture-to-pars(Capture $c) {
#     $c.hash.kv.map: -> $flag, \value {
#         given value {
#             when value =:= True {
#             }
#         }
#     }
# }

method ls(IO() $dir = ".".IO --> RakuSH::Proc) {
    my @files = $dir.dir;

    RakuSH::Proc.new:
        :cmd[qq<.ls: "$dir.absolute()">],
        :out(RakuSH::Table.new: :data(@files.map: { self.file($_).out }), :columns(RakuSH::File.columns))
    ;
}

method file(IO() $file) {
    RakuSH::Proc.new: :cmd[".file: $file.absolute()"], :out(RakuSH::File.new: $file);
}

method open(IO() $file, @columns, Str :$separator = ":") {
    my @err;
    RakuSH::Proc.new:
        :cmd[qq{.open: :separator($separator), <@columns[]>}],
        :out(
            RakuSH::Table.new:
                :@columns,
                :data(
                    $file.lines.map: {
                        my @data = .split: $separator;
                        if @data < @columns {
                            @err.push: .Str;
                            next
                        }
                        %( @columns Z[=>] @data )
                    }
                )
        ),
        :err(
            RakuSH::List.new: :data(@err)
        )
}

multi r(@cmd, RakuSH::Proc $proc) is export {
    do with $proc.proc {
      my $p = run @cmd, :in($proc.proc.out), :out, :err;
      $proc.clone: :cmd[|$proc.cmd, "==> r <@cmd[]>"], :proc($p)
    } else {
        die "NYI"
    }
}

multi grep(&block, RakuSH::Proc $proc) is export {
    $proc.apply: "==> grep &block", *.grep: &block
}

multi AT-POS(UInt $num, RakuSH::Proc $proc) is export {
    $proc.apply: "==> AT-POS $num", *[$num]
}

multi to(RakuSH::Proc $proc, Bool :$list! where *.so) is export {
    $proc.apply: "==> to :list", *.to-list
}

sub ignore-column(*@name) is export {
    my RakuSH::Proc $proc = @name.pop;
    $proc.apply: "==> ignore-column <@name[]>", *.ignore-column: @name
}
