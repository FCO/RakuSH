use RakuSH;

sub EXPORT {
  my %meth = RakuSH.^methods.map: {
    my $name = .name;

    "&$name" => sub (|c) { $*rakuish."$name"(|c) }
  };
  my %bin = RakuSH.list-bins(%*ENV<PATH>.split(":")».IO).map: {
    my $name = .basename;
    next if %meth{"&$name"};
    next if RakuSH::EXPORT::ALL::{"&$name"};

    "&$name" => sub (|c) { $*rakuish."$name"(|c) }
  };
  Map.new: %( |%bin, |%meth )
}
