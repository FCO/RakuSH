use RakuSH::Row;

unit class RakuSH::File is RakuSH::Row;

has IO::Path $.io-path handles *;

method summary { $!io-path.absolute }

method new(IO::Path() $file) {
    ::?CLASS.bless:
      :io-path($file),
      :cmd[qq|.file: "$file.absolute()"|],
      :data{
          name => $file.relative,
          type => do given $file {
              when :l { "link" }
              when :f { "file" }
              when :d { "dir"  }
          },
          |$.columns.grep({ $_ eq <name type>.none }).map: -> $meth {
              my $val = $file."$meth"();
              $val .= DateTime() if $val ~~ Instant;
              $meth => $val
          }
      },
    ;
}

method columns { <name type mode modified accessed changed> }
