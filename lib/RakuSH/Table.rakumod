use RakuSH::Output;
use RakuSH::List;
use RakuSH::Utils;

unit class RakuSH::Table is RakuSH::List does Positional;

has Str @.columns;

method default-format { "table" }

method table {
    my @columns     = "#", |@!columns;
    my %column-size = @columns.map: {
        $_ => (
            .Str eq "#"
            ?? @.data.elems.chars
            !! @.data»{$_}».Str».chars.max max .chars
        )
    };
    my $index = 0;
    my @data  = @.data.map({
      @columns.map(-> Str $col {
          $col eq "#"
          ?? grey ($index++).fmt: "%{%column-size{ $col } }d"
          !! .{$col}.gist.fmt: "% -{ %column-size{ $col } }s"
      })
    });
    [
        "┌─" ~ @columns».&{ "─" x %column-size{ $_ } }.join("─┬─") ~ "─┐",
        "│ " ~ @columns».&{ .fmt("%{ %column-size{ $_ } }s").&header }.join(" │ ") ~ " │",
        "├─" ~ @columns».&{ "─" x %column-size{ $_ } }.join("─┼─") ~ "─┤",
        |@data.map(-> @row { "│ " ~ @row».Str.join(" │ ") ~ " │"}),
        "└─" ~ @columns».&{ "─" x %column-size{ $_ } }.join("─┴─") ~ "─┘",
    ].join("\n") ~ "\n"
}

method ignore-column(Str $column-name where { @!columns.any eq $column-name }) {
    self.clone: :cmd[|@.cmd, "==> ignore-column $column-name"], :columns(@!columns.grep: { $_ ne $column-name})
}

multi to(::?CLASS:D $_, Bool :$list! where *.so) is export {
    .to-list
}

method to-list {
    RakuSH::List.new:
        :cmd[|@.cmd, "==> to :list"],
        :data(@.data.map: -> %row {
            %row ~~ RakuSH::Output
            ?? %row.summary
            !! @!columns».&{ "{ .Str }: { %row{$_} }" }.join: "; "
        }),
}

sub ignore-column($name, ::?CLASS $table) is export {
    $table.ignore-column: $name
}
