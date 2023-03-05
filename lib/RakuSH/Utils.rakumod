unit package RakuSH::Utils;

sub grey($data)                                           is export {"\o33[30;1m{ $data.Str }\o33[m"}
sub bold($data)                                           is export {"\o33[1m{ $data.Str }\o33[m"}
multi header($data where { $data ~~ m{ ^\s* '#' \s*$ } }) is export { grey $data }
multi header($data)                                       is export { bold $data.Str }

