NAME
====

RakuSH - First try on a raku shell that uses data instead of strings

SYNOPSIS
========

```
➜  RakuSH git:(main) ✗ raku -I. -MRakuSH -MRakuSH::Output -MRakuSH::Table
Welcome to Rakudo™ v2022.12.
Implementing the Raku® Programming Language v6.d.
Built on MoarVM version 2022.12.

To exit type 'exit' or '^D'
[0] > $_ = RakuSH.new
RakuSH.new(pwd => IO::Path.new(".", :SPEC(IO::Spec::Unix), :CWD("/Users/fernando/RakuSH")))
[1] >
[1] >
[1] > .ls
CMD:
    ls "/Users/fernando/RakuSH"

┌────┬────────────┬──────┬──────┬─────────────────────────────┬─────────────────────────────┬─────────────────────────────┐
│  # │       name │ type │ mode │                    modified │                    accessed │                     changed │
├────┼────────────┼──────┼──────┼─────────────────────────────┼─────────────────────────────┼─────────────────────────────┤
│  0 │ .precomp   │ dir  │ 0755 │ 2023-03-04T00:34:21.332554Z │ 2023-03-04T00:34:21.331773Z │ 2023-03-04T00:34:21.332554Z │
│  1 │ META6.json │ file │ 0644 │ 2023-03-05T04:18:19.438561Z │ 2023-03-05T04:18:20.748051Z │ 2023-03-05T04:18:19.438561Z │
│  2 │ LICENSE    │ file │ 0644 │ 2023-03-04T00:34:21.013972Z │ 2023-03-04T00:34:22.771856Z │ 2023-03-04T00:34:21.013972Z │
│  3 │ bin        │ dir  │ 0755 │ 2023-03-04T00:34:20.983019Z │ 2023-03-04T00:34:20.983019Z │ 2023-03-04T00:34:20.983019Z │
│  4 │ Changes    │ file │ 0644 │ 2023-03-04T00:34:21.013887Z │ 2023-03-04T00:34:22.758653Z │ 2023-03-04T00:34:21.013887Z │
│  5 │ t          │ dir  │ 0755 │ 2023-03-04T00:34:21.013375Z │ 2023-03-04T00:34:21.140031Z │ 2023-03-04T00:34:21.013375Z │
│  6 │ README.md  │ file │ 0644 │ 2023-03-04T00:34:21.361297Z │ 2023-03-04T00:34:22.762220Z │ 2023-03-04T00:34:21.361297Z │
│  7 │ .gitignore │ file │ 0644 │ 2023-03-04T00:34:21.013726Z │ 2023-03-04T00:34:21.048920Z │ 2023-03-04T00:34:21.013726Z │
│  8 │ .github    │ dir  │ 0755 │ 2023-03-04T00:34:20.983359Z │ 2023-03-04T00:34:21.140058Z │ 2023-03-04T00:34:20.983359Z │
│  9 │ lib        │ dir  │ 0755 │ 2023-03-05T05:04:39.734350Z │ 2023-03-05T05:04:39.748419Z │ 2023-03-05T05:04:39.734350Z │
│ 10 │ .git       │ dir  │ 0755 │ 2023-03-05T05:04:39.748023Z │ 2023-03-04T00:34:21.027015Z │ 2023-03-05T05:04:39.748023Z │
│ 11 │ dist.ini   │ file │ 0644 │ 2023-03-04T00:34:21.013809Z │ 2023-03-04T00:34:22.765462Z │ 2023-03-04T00:34:21.013809Z │
└────┴────────────┴──────┴──────┴─────────────────────────────┴─────────────────────────────┴─────────────────────────────┘

[2] > .ls ==> grep *.f
CMD:
    ls "/Users/fernando/RakuSH"
    ==> grep &block

┌───┬────────────┬──────┬──────┬─────────────────────────────┬─────────────────────────────┬─────────────────────────────┐
│ # │       name │ type │ mode │                    modified │                    accessed │                     changed │
├───┼────────────┼──────┼──────┼─────────────────────────────┼─────────────────────────────┼─────────────────────────────┤
│ 0 │ META6.json │ file │ 0644 │ 2023-03-05T04:18:19.438561Z │ 2023-03-05T04:18:20.748051Z │ 2023-03-05T04:18:19.438561Z │
│ 1 │ LICENSE    │ file │ 0644 │ 2023-03-04T00:34:21.013972Z │ 2023-03-04T00:34:22.771856Z │ 2023-03-04T00:34:21.013972Z │
│ 2 │ Changes    │ file │ 0644 │ 2023-03-04T00:34:21.013887Z │ 2023-03-04T00:34:22.758653Z │ 2023-03-04T00:34:21.013887Z │
│ 3 │ README.md  │ file │ 0644 │ 2023-03-04T00:34:21.361297Z │ 2023-03-04T00:34:22.762220Z │ 2023-03-04T00:34:21.361297Z │
│ 4 │ .gitignore │ file │ 0644 │ 2023-03-04T00:34:21.013726Z │ 2023-03-04T00:34:21.048920Z │ 2023-03-04T00:34:21.013726Z │
│ 5 │ dist.ini   │ file │ 0644 │ 2023-03-04T00:34:21.013809Z │ 2023-03-04T00:34:22.765462Z │ 2023-03-04T00:34:21.013809Z │
└───┴────────────┴──────┴──────┴─────────────────────────────┴─────────────────────────────┴─────────────────────────────┘

[3] > .ls ==> grep *.f ==> AT-POS 5
CMD:
    .file: "/Users/fernando/RakuSH/dist.ini"

accessed : 2023-03-04T00:34:22.765462Z
 changed : 2023-03-04T00:34:21.013809Z
    mode : 0644
modified : 2023-03-04T00:34:21.013809Z
    name : dist.ini
    type : file

[4] > .ls ==> grep *.f ==> to :list
CMD:
    ls "/Users/fernando/RakuSH"
    ==> grep &block
    ==> to :list

0 - /Users/fernando/RakuSH/META6.json
1 - /Users/fernando/RakuSH/LICENSE
2 - /Users/fernando/RakuSH/Changes
3 - /Users/fernando/RakuSH/README.md
4 - /Users/fernando/RakuSH/.gitignore
5 - /Users/fernando/RakuSH/dist.ini
```

DESCRIPTION
===========

RakuSH is still at the beginning of development

AUTHOR
======

    Fernando Corrêa <fernando correa@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2023 Fernando Corrêa

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

