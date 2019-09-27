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

## Check JSON files

### Valid JSON (without jq)

``` bash
cat <path/to/file> |  python -c "import sys, json; print json.load(sys.stdin)
```

## Check sudo commands

See history of sudo calls

``` bash
# Thanks to https://unix.stackexchange.com/questions/167935/details-about-sudo-commands-executed-by-all-user

# Ubuntu 18.04
sudo grep sudo /var/log/auth.log

# Some other distros
sudo grep sudo /var/log/secure

```
