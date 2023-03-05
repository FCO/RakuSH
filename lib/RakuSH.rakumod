use RakuSH::Output;
use RakuSH::Table;
use RakuSH::File;

unit class RakuSH;

has IO::Path $.pwd = ".".IO;

method ls(IO() $dir = ".".IO --> RakuSH::Table) {
    my @files = $dir.dir;

    RakuSH::Table.new: :cmd[qq<ls "$dir.absolute()">], :data(@files.map: { self.file: $_ }), :columns(RakuSH::File.columns);
}

method file(IO() $file) {
    RakuSH::File.new: $file;
}
