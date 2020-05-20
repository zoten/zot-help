# Useful images

## Debug a failing container

### docker events

If container fails to start, you can tail docker logs with

```
docker events&
docker logs <copy the instance id from docker events messages on screen>
```

### entrypoint

Change the entrypoint

```
docker run -it --name my-name --rm --entrypoint /bin/bash <IMAGE> -s
```

## Connect in shell

```
docker exec -it tag bash
```


## Swagger-UI

```
docker run -p 80:8080 -e SWAGGER_JSON=/foo/swagger.json -v /bar:/foo swaggerapi/swagger-ui
```


