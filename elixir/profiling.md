# Profiling

## fprof and mix

```
time mix profile.fprof --callers=true --sort=own --details -e ":mnesia.activity(:transaction, fn -> :mnesia.read(:table, \"key\") end )" > trace_clear.txt
```
