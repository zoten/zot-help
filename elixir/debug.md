# Debug

Utilities and nice to know for dev debugging

## "gdb"

``` elixir
require IEx

value = {:some, :erlang, :value}
IEx.pry
```

Note that you *must* be running in a iex session (e.g. `iex -S mix phx.server`)

## Print stacktrace

``` elixir
IO.inspect(Process.info(self(), :current_stacktrace), label: "STACKTRACE")
```
## Tracing

Thanks umbe

``` elixir
:dbg.tracer # starts a process receiving and printing tracing messagges
:dbg.p :all, :c # tracces all processes and ports
:dbg.tp {Module, :fun, :_}, :cx # match calls to module.fun
:dbg.tpl # match non exported functions
```
