use RakuSH::Utils;
unit role RakuSH::Output;

method default-format { ... }
method summary        { .gist }


method gist(Str:D :$method-name where { self.^can: $method-name } = self.default-format) {
    self."$method-name"()
}

multi grep(&block, RakuSH::Output $out) is export {
    $out.grep: &block
}

multi AT-POS(UInt $num, @out) is export {
    @out[$num]
}
