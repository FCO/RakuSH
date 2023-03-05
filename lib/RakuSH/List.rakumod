use RakuSH::Output;
use RakuSH::Utils;

unit class RakuSH::List does RakuSH::Output does Positional;

has @.data handles <AT-POS elems>;

method default-format { "list" }

method grep(&block) {
    self.clone: :cmd[|@.cmd, "==> grep &block"], :data(@!data.grep: &block)
}

multi method sort(&block) {
    self.clone: :cmd[|@.cmd, "==> sort &block"], :data(@!data.sort: &block)
}

method list {
    my $index = 0;
    @!data.map({
        "{ grey $index++ } - { .Str }"
    }).join("\n") ~ "\n"
}
