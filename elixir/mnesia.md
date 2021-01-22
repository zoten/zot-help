# Mnesia

Tips and tricks to work with mnesia, and with mnesia from elixir

## Elixir-like syntax

Useless? Maybe

``` elixir
alias :mnesia, as: Mnesia
```

## Wrappers

(TBD impressions on wrappers. Using ecto3_mnesia atm, but huge limitations for my needs)

## Mnesia operations

### Select all records

Erlang

``` erlang
% Thanks to https://lookonmyworks.co.uk/2013/07/08/selecting-all-records-from-an-mnesia-table/
F = fun() -> mnesia:select(Tab,[{'_',[],['$_']}]) end,
mnesia:activity(transaction, F).
```

Elixir

``` elixir
fun = fn -> :mnesia.select(:sims,[{'_',[],['$_']}]) end
:mnesia.activity(:transaction, fun)
```
