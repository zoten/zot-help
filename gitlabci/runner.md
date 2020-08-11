# Run runners locally

Taken from [SO](https://stackoverflow.com/questions/32933174/use-gitlab-ci-to-run-tests-locally)

```
apt-get install gitlab-runner
```

```
gitlab-runner exec docker my-job-name
```

```
gitlab-runner exec docker test --docker-volumes "/home/zoten/.ssh/id_rsa:/root/.ssh/id_rsa:ro"
```
