# ETS cheatsheet

## Creation

e.g. cache accessible to new processes for async streams

``` elixir
ref = :ets.new(:ets_name, [:named_table, :public, :set])
```

## Insert

``` elixir
:ets.insert(:ets_name, {:key, value})
```


## Lookup

``` elixir
:ets.insert(:ets_name, :key)
# this will return
# {:key, {:key, value}}
# so watch up the double tuple
```

## Ownership

Little trick: if you fear you process may die and you need a "persistent" ETS, you can gift it to an owner process that will only keep ETS ownerhip
Make process Pid the new owner of table Table. If successful, message {'ETS-TRANSFER',Table,FromPid,GiftData} is sent to the new owner.

The process Pid must be alive, local, and not already the owner of the table. The calling process must be the table owner.

``` elixir
:ets.give_away(table, pid, gift_data)
```

`pid` process will get a `{:"ETS-TRANSFER", table, from_pid, gift_data}` message
