# Gunicorn

## Code reload

When deploying python apps in container via *sgi you cannot kill the application if it is the main process
Find parent PID of gunicorn process (no workers) and:

``` bash
kill -hup <pid>
```
