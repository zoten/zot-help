# Erlixir

Tips for interworking with erlang functions or porting erlang code

## iex -> elixir -> erlang options

``` bash
# Pass switches to erlang
iex --erl "-kernel net_ticktime 10" --name "app@127.0.0.1" -S mix
```
 
## <<>>

``` erlang
<<part:4/binary, ...>>
```

``` elixir
<<part::size(4)::binary(), ...>>
```

## Number notation

hexadecimal

``` erlang
% 15
16#f
```

``` elixir
# 15
0xf
```
