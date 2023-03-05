use RakuSH::Output;
use RakuSH::Utils;

unit class RakuSH::Row does RakuSH::Output does Associative;

has %.data handles <AT-KEY elems keys>;

method FALLBACK($meth where { %!data{$meth}:exists }) {
    %!data{$meth}
}

method default-format { "row" }

method row {
    my UInt $max-size = %!data.keys».chars.max + 10;
    %!data.keys.sort.map(-> $key {
        sprintf "%{ $max-size }s : %s", grey($key), bold(%!data{ $key })
    }).join("\n") ~ "\n"
}
