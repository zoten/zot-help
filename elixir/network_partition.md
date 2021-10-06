# Network Partitions

Create network partitions from erlang nodes
From [this article](https://web.archive.org/web/20131029050630/http://djui.io/2011/03/18/simulating-net-splits-in-erlang/)

## Destructive

### Crash VM

from within

``` erlang
os:cmd("kill -9 " ++ os:getpid()).
```

### Kill VM

``` erlang
erlang:halt().
```

``` erlang
init:stop().
```

## Temporary

### Halt VM

``` erlang
os:cmd("kill -STOP " ++ os:getpid()).
```

### Kill net_kernel

``` erlang
timer:kill_after(0, whereis(net_kernel)).
```

## Other emthods

See [iptables](https://github.com/zoten/zot-help/blob/master/iptables.md) section
