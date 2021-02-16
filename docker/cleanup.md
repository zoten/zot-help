# Cleanup

Utilities for cleanup

## Remove an image and all tags

Thanks to [rahasak](https://medium.com/rahasak/delete-docker-image-with-all-tags-c631f6049530)

Give nan image e.g. dockhub.lan.enterprise.com/images/mygreppableymagename

``` bash
docker images | grep "mygreppableymagename" | tr -s ' ' | cut -d ' ' -f 2 | xargs -I {} docker rmi dockhub.lan.enterprise.com/images/mygreppableymagename:{}
```
