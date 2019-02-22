# System helpers

## Network

### Find process using specific port (or address)

``` bash
# list all processes listening on x.y.z.k:3868
lsof -i :3868
```
### Restart networking module

Sometimes Ubuntu, returning back from suspension, lose networking

``` bash
sudo modprobe -r r8169 && sudo modprobe r8169
```
