# Erlixir

Tips for interworking with erlang functions or porting erlang code

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
