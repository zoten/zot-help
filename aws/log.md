# Log

Tips for working with horrible aws logs

## Cloudwatch log insights

Wonderful tool, not so easy to work with

### Fetch logs not containing a word

Ever had a service that spawns lots of logs so you cannot distinguish others? Bam

```
fields @timestamp, @message
 sort @timestamp desc
 limit 200
 filter @message like /^((?!watch).)*$/
 filter @message like /^((?!Watch).)*$/
```
