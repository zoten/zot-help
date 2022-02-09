# curl

## Wikipedia stream

did you know that you can stream events from wikipedia? Thanks, Papito!

``` bash
curl -s -H 'Accept: application/json' https://stream.wikimedia.org/v2/stream/recentchange | jq .
```
