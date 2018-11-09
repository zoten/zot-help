# Bash

Tips and tricks

## Running Processes

### Grep and kill

``` bash
kill $(ps aux | grep '[p]ython manage.py' | awk '{print $2}')
```
