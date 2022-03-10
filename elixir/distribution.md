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

I usually use docker containers to have a sandbox and be able to touch networking stuff to try and test cluster capabilities in a local environment
Also, you should install iproute2 in each container

``` bash
# # Add latency of 100ms in outbound traffic for udm-0 and udm-1
docker exec app-0 tc qdisc add dev eth0 root netem delay 100ms
docker exec app-1 tc qdisc add dev eth0 root netem delay 100ms
```
