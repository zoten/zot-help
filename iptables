# iptables

Useful commands to screw up your network

## Block ports

From [this](https://web.archive.org/web/20131029050630/http://djui.io/2011/03/18/simulating-net-splits-in-erlang/) aticle about simulting network splits in erlang

``` bash
# Apply rules
sudo iptables -I INPUT --proto tcp --dport 52236 -j REJECT
sudo iptables -I INPUT --proto tcp --sport 52236 -j REJECT
sudo iptables -I INPUT --proto tcp --dport 52328 -j REJECT
sudo iptables -I INPUT --proto tcp --sport 52328 -j REJECT
# List rules
sudo iptables -S

-P INPUT ACCEPT
-P FORWARD ACCEPT
-P OUTPUT ACCEPT
-A INPUT -s 127.0.1.1/32 -j DROP
-A INPUT -d 127.0.1.1/32 -j DROP

# Flush rules in all chains
sudo iptables -F
```

## Block traffic from/to network interface

``` bash
# Apply rules
sudo iptables -I INPUT --destination 127.0.1.1 -j DROP
sudo iptables -I INPUT --source 127.0.1.1 -j DROP

# Flush rules in all chains
sudo iptables -F
```

