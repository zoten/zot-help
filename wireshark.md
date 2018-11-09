# Remote wireshark

## Wireshark 1.x

``` bash
ssh $USER@$HOST "tcpdump -l -U -i any -w - sctp or port 5060 or port 5080 or port 3869 or port 3868 or 2152 or 2123" | wireshark-gtk -k -i -
```

## Wireshark 2.x

``` bash

# Various ways, some work, some don't, still exploring
wireshark-gtk -k -i <(ssh -p 22 $USER@$HOST "tcpdump -B 4096 -n -K -U -i ens160 -w - not port 22 ")
wireshark-gtk -k -i <(ssh -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $USER@$HOST "tcpdump -B 4096 -n -K -l -U -i any -w - not port 22")

ssh -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $USER@$HOST "tcpdump -B 4096 -n -K -l -U -i any -w - not port 22" | wireshark-gtk -k -i -

```

# Useful filters

Thanks to umbe

``` bash
# First let's convert IP in hex via shell
printf '%02x' 192 168 1 128 ; echo

# filter by source IP 0x0abe0001
udp port 2152 and ((udp[8:1]==0x32 and udp[32:4]==0x0abe0001) or
(udp[8:1]==0x30 and udp[28:4]==0x0abe0001))

# filter by dest ip destinazione 0x0abe0001
udp port 2152 and ((udp[8:1]==0x32 and udp[36:4]==0x0abe0001) or
(udp[8:1]==0x30 and udp[32:4]==0x0abe0001))

# filter by teid 0x00000001 (up prints it reversed)
udp port 2152 and udp[12:4]==0x00000001
```
