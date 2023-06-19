# Kernel management

## Remove outdated kernels

``` bash
# Current kernel
uname -a
# list kernels
dpkg --list | egrep -i --color 'linux-image|linux-headers|linux-modules' | awk '{ print $2 }'
# remove unneeded ones
sudo apt purge <list>
```
