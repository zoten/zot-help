# Networking stuff

## Get IP of GitlabCI service

In `.gitlabci.yml` add

```
...
# e.g. get postgres service ip addr
IPADDR=$( getent hosts postgres | awk '{ print $1 }' )
...
```
