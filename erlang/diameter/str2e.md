# str2e

``` 
#!/usr/bin/env escript
# This is Umberto Corponi's work
# https://www.linkedin.com/in/umberto-corponi-3a484421/
# Really, check out this guy

# This script converts an hex string (e.g. message from wireshark)
# to an erlang/elixir loadable binary format


-compile([debug_info]).

main([StrBin]) ->
    Bin = hexstr_to_bin(StrBin),
    io:format("~w~n", [Bin]).

hexstr_to_bin(S) ->
  hexstr_to_bin(S, []).
  hexstr_to_bin([], Acc) ->
    list_to_binary(lists:reverse(Acc));
    hexstr_to_bin([X,Y|T], Acc) ->
      {ok, [V], []} = io_lib:fread("~16u", [X,Y]),
        hexstr_to_bin(T, [V | Acc]);
hexstr_to_bin([X|T], Acc) ->
  {ok, [V], []} = io_lib:fread("~16u", lists:flatten([X,"0"])),
    hexstr_to_bin(T, [V | Acc]).
```
