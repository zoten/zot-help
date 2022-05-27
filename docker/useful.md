# Useful images

## Debug a failing container

### docker events

If container fails to start, you can tail docker logs with

``` bash
docker events&
docker logs <copy the instance id from docker events messages on screen>
```

### entrypoint

Change the entrypoint

``` bash
docker run -it --name my-name --rm --entrypoint /bin/bash <IMAGE> -s
```

## Connect in shell

``` bash
docker exec -it tag bash
```


## Swagger-UI

``` bash
docker run -p 80:8080 -e SWAGGER_JSON=/foo/swagger.json -v /bar:/foo swaggerapi/swagger-ui
```

## Connect as root in ubuntu-like containers

``` bash
docker exec -it -u 0 <IMAGE> bash
```

## Swiss knife for networking

[netshoot](https://hub.docker.com/r/nicolaka/netshoot)

``` bash
# network namespace
docker run -it --net container:<container_name> nicolaka/netshoot
# host
docker run -it --net host nicolaka/netshoot

# throw away
kubectl run tmp-shell --rm -i --tty --image nicolaka/netshoot -- /bin/bash
# network namespace
kubectl run tmp-shell --rm -i --tty --overrides='{"spec": {"hostNetwork": true}}' --image nicolaka/netshoot -- /bin/bash
```
