use RakuSH::Output;
use RakuSH::List;
use RakuSH::Utils;

unit class RakuSH::Table is RakuSH::List does Positional;

has Str @.columns;

method default-format { "table" }

method table {
    # TODO: Make it work for multiline cels
    my @columns     = "#", |@!columns;
    my %column-size = @columns.map: {
        $_ => (
            .Str eq "#"
            ?? @.data.elems.chars
            !! @.data»{$_}.map({ (.defined ?? .Str !! "").chars }).max max .chars
        )
    };
    my $index = 0;
    my @data  = @.data.map({
      @columns.map(-> Str $col {
          $col eq "#"
          ?? grey ($index++).fmt: "%{%column-size{ $col } }d"
          !! (.{$col} // "").gist.fmt: "% -{ %column-size{ $col } }s"
      })
    });
    [
        "┌─" ~ @columns».&{ "─" x %column-size{ $_ } }.join("─┬─") ~ "─┐",
        "│ " ~ @columns».&{ .fmt("%{ %column-size{ $_ } }s").&header }.join(" │ ") ~ " │",
        "├─" ~ @columns».&{ "─" x %column-size{ $_ } }.join("─┼─") ~ "─┤",
        |@data.map(-> @row { "│ " ~ @row.map({ .defined ?? .Str !! "" }).join(" │ ") ~ " │"}),
        "└─" ~ @columns».&{ "─" x %column-size{ $_ } }.join("─┴─") ~ "─┘",
    ].join("\n") ~ "\n"
}

method ignore-column(*@column-name where { @!columns.any eq @column-name.all }, *%pars where { .keys.all eq @!columns.any }) {
    self.clone: :columns(@!columns.grep: { $_ eq [|@column-name, %pars.keys].none })
}

method to-list {
    RakuSH::List.new:
        :data(@.data.map: -> %row {
            %row ~~ RakuSH::Output
            ?? %row.summary
            !! @!columns».&{ "{ .Str }: { %row{$_} }" }.join: "; "
        }),
}
