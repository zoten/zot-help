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

[docs](https://erlang.org/doc/man/dbg.html)
[erlang in anger](http://www.erlang-in-anger.com/) chapter 9.1

``` elixir
:dbg.tracer # starts a process receiving and printing tracing messagges
:dbg.p :all, :c # tracces all processes and ports
:dbg.tp {Module, :fun, :_}, :cx # match calls to module.fun
:dbg.tpl # match non exported functions
```

## Quaff

Use Erlang debugger in Elixir

Sources: [Quaff](https://github.com/qhool/quaff) and [tutorial](http://qhool.github.io/elixir/2014/02/06/elixir-debug.html)

TL;DR

``` elixir
# mix.exs
def deps
# ...
  {:quaff, github: "qhool/quaff", branch: "master", only: [:dev, :test]},
# ...
end
```

Using Quaff shortcuts

``` elixir
# Start debugger
Quaff.Debug.start()
# load all modules in source file
Quaff.Debug.load("./lib/mymodule.ex")
# load a module by name
Quaff.Debug.load(Yet.AnotherModule)
# debugs the module[s] on all known nodes
nload(Yet.AnotherModule) # or
load(Yet.AnotherModule, all_nodes: true)
```

Using tutorial way

``` elixir
# Start debugger
Quaff.Debug.start()
# Read BEAM file
{:ok,beam_bin} = File.read("./_build/dev/lib/myapp/ebin/Elixir.MyModule.beam")
:int.i({MyApp.MyModule,'./lib/mymodule.ex','./_build/dev/lib/myapp/ebin/Elixir.MyModule.beam',beam_bin})

# Now will show in the debugger
```
