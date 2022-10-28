# Distribution

Tips&tricks for working with distribution

## iex in distribution

``` bash
# Shell 0

# Set ticktime to a lower value if you need to work on partitioning events etc
export ELIXIR_ERL_OPTIONS="-kernel net_ticktime 2"
iex --name app0@127.0.0.1 --cookie secret -S mix
```


``` bash
# Shell 1

# Set ticktime to a lower value if you need to work on partitioning events etc
export ELIXIR_ERL_OPTIONS="-kernel net_ticktime 2"
iex --name app1@127.0.0.1 --cookie secret -S mix
```

## simulate partitions

### iex / local environment

I got to use [epmdpxy](https://github.com:dergraf/epmdpxy) to simulate partitions in easy cases (README covers everything)

## simulate latency

### docker container

####  Manual

I usually use docker containers to have a sandbox and be able to touch networking stuff to try and test cluster capabilities in a local environment
Also, you should install iproute2 in each container

``` bash
# # Add latency of 100ms in outbound traffic for udm-0 and udm-1
docker exec app-0 tc qdisc add dev eth0 root netem delay 100ms
docker exec app-1 tc qdisc add dev eth0 root netem delay 100ms
```

#### blockade

Still to test, but nice it exists: [blockade](https://github.com/worstcase/blockade)

## Remote code

### Take existing module and load to remote node

``` elixir
# filename should be a charlist
{_module, binary, filename} = :code.get_object_code(Module)
:rpc.call(node, :code, :load_binary, [Module, filename, binary])
```

You can also create a module on the fly

``` elixir
# e.g. https://elixirforum.com/t/loading-runtime-generated-module-into-remote-nodes/34864
module = Module.concat(MyProject, MyModule)
contents = Code.string_to_quoted!("def base(), do: IO.puts(\"test\")")
Module.create(module, contents, Macro.Env.location(__ENV__))
```
