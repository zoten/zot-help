# Debug

Hints for debugging in production

## Enter shell (release)

If built with a `mix release`, app will ship with a command line tool

``` bash
# From app root, or docker app pwd if dockerized
cd bin
./<appname>_rc_exec.sh remote_console

# Other useful commands,like ping or other shell options
```

## Get process state

If you log pids on app logs, you can use it to inspect state (for "fixed" pids obv)
e.g. if log is something like

``` bash
08:45:27.974 pid=<0.1202.17> [warn] this process has a warning
```

```
pid = :c.pid(0, 1202, 17)
:sys.get_state(pid)
```
