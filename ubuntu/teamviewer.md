# TeamViewer

## Daemon

Reminder note that TeamViewer installs a daemon to work. If you don't like it to be up, disable via systemd

``` bash
# bring the thing down
sudo systemctl disable teamviewerd.service && sudo systemctl stop teamviewerd.service
# bring the thing up
sudo systemctl enable teamviewerd.service && sudo systemctl start teamviewerd.service
```
