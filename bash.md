# Bash

Tips and tricks

## Running Processes

### Grep and kill

``` bash
kill $(ps aux | grep '[p]ython manage.py' | awk '{print $2}')
```

## File sizes

### Big files

``` bash
# List the 20 largest files/dirs under the current directory
# twitter @climagic

du -ma | sort -nr | head -n 20
```
