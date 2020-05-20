# Useful images

## Debug a failing container

If container fails to start, you can tail docker logs with

```
docker events&
docker logs <copy the instance id from docker events messages on screen>
```

## Connect in shell

```
docker exec -it tag bash
```


## Swagger-UI

```
docker run -p 80:8080 -e SWAGGER_JSON=/foo/swagger.json -v /bar:/foo swaggerapi/swagger-ui
```


