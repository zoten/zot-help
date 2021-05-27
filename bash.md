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

## Inotify watches

``` bash
# Thanks to https://unix.stackexchange.com/questions/13751/kernel-inotify-watch-limit-reached

# first column will be the number of inotify fds (not the number of watches though)
find /proc/*/fd -lname anon_inode:inotify |
   cut -d/ -f3 |
   xargs -I '{}' -- ps --no-headers -o '%p %U %c' -p '{}' |
   uniq -c |
   sort -nr
```

## SSH tunnel

``` bash
# Forwards local 127.0.0.1:8080 to remote 127.0.0.1:8082 on machine 10.10.0.1
ssh -L 127.0.0.1:8080:127.0.0.1:8082 root@10.10.0.1
```
