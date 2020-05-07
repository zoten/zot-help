# Erlang

Helpers to work in Erlang language

## Be sure that everything is recompiled

``` shell
rm -rf _build && rebar3 compile
```

## Bitstrings

### Pattern matching

You can do super useful  partial pattern matching

``` erlang
<<A:48,_:12,C:68>> = Var.
```

### Print int

(thanks to @papito.favaro)
Sometimes codepoints eval to printable characters, e.g.

``` erlang
<<"efghijklmnopqrst">>
```

you can use

``` erlang
io:format("~w~n", [<<"efghijklmnopqrst">>]).
[0|erlang:binary_to_list(<<"efghijklmnopqrst">>)].

<<101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116>>
```

to print codepoints
