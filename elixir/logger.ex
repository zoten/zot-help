# Logger

Tricks for useful logging

## Runtime Configuration

Thanks to @alberto.sartori for enlightenment

``` elixir
# ofc logs need not to be stripped. Put 

compile_time_purge_matching: [
    [level_lower_than: :debug]
  ]

# in target production env's config
```

``` bash
# Release distilled
cd /opt/app/bin
./appname_rc_exec.sh remote_console
```

```
# Logger's global level decides whether to pass logs to backends
# Backend's level decides whether to print or not the log
# Logs need not to be stripped using
# 

Logger.configure(level: :debug)
# In my case we were into a docker instance, so log was on stdout
# Log backend must be already started
Logger.configure_backend(:console, level: :debug)
```
