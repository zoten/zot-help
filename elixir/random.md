# Random

My favourite geenrators of random stuff

## Random Strings

Mostly from [here](https://dev.to/diogoko/random-strings-in-elixir-e8i) , since I have visited it a million times :)

``` elixir
symbols = '0123456789abcdef'
symbol_count = Enum.count(symbols)
s = for _ <- 1..10, into: "", do: <<Enum.at(symbols, :crypto.rand_uniform(0, symbol_count))>>
```
