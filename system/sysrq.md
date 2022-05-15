# SysRq

[source](https://linuxconfig.org/how-to-enable-all-sysrq-functions-on-linux)

## Enable all sysrq commands

```bash
# you probably need sudo su

# enable all
echo "1" > /proc/sys/kernel/sysrq

# make persistent
echo "kernel.sysrq = 1" >> /etc/sysctl.d/99-sysctl.conf
```

## Reisub

 * First of all `r` switches the keyboard from raw to XLATE mode, 
 * `e` sends a SIGTERM signal to all processes, so that they can be closed in a graceful way if possibile.
 * After that we send a SIGKILL signal by pressing `i`, to terminate remaining process which didn’t respond to the previous signal.
 * With `s` we try to sync all mounted filesystems and flush all changes from cache to the disk immediately.
 * By using `u` we remount all filesystems in read only mode
 * and finally by pressing `b`, we perform a system reboot.

The reisub sequence can be used in certain situations when the system becomes very unresponsive, and other solutions are not enough to fix things. 
