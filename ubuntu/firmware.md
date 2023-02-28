# Firmware update

Sometimes some firmware updates get stucked in _not in cabinet format_ error messages (e.g. kubuntu+discover)

``` bash
# https://askubuntu.com/questions/1453959/getting-the-input-is-not-of-cabinet-format-on-discover
# power charger on
sudo apt install fwupd
sudo fwupdmgr refresh
sudo fwupdmgr update
# reboot
```
