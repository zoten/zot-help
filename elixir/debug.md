# Debug

Utilities and nice to know for dev debugging

## "gdb"

```
require IEx

value = {:some, :erlang, :value}
IEx.pry
```

Note that you *must* be running in a iex session (e.g. `iex -S mix phx.server`)

## Print stacktrace

```
IO.inspect(Process.info(self(), :current_stacktrace), label: "STACKTRACE")
```
