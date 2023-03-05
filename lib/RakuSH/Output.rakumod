use RakuSH::Utils;
unit role RakuSH::Output;

method default-format { ... }
method summary        { .gist }

has Str @.cmd;

method gist(Str:D :$method-name where { self.^can: $method-name } = self.default-format) {
    [
        self.cmd-str,
        "",
        self."$method-name"()
    ].join: "\n"
}

method cmd-str {
    [
        grey("CMD:"),
        |@!cmd.map(&bold).join("\n").indent: 4
    ].join: "\n"
}

multi grep(&block, RakuSH::Output $out) is export {
    $out.grep: &block
}

multi AT-POS(UInt $num, @out) is export {
    @out[$num]
}
