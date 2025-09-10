# Performance debug

Slow notebook? Lagging network? Oh, it's probably Chrome.

## High usage processes

``` bash
ps -eo pid,ppid,cmd,comm,%mem,%cpu --sort=-%cpu | head -10

ps -eo pid,ppid,cmd,comm,%mem,%cpu --sort=-%mem | head -10
```
