# Git bulk actions

Utilities to manage multiple files at once in edge situations

## Add files deleted manually

From stackoverflow, lost the link :(

Situation: you manually deleted files, not using git. You need to add the deletions to the commit

``` bash
git status | grep 'deleted:' | cut -d':' -f2  | xargs -t   -I {}  git add  -u "{}"
```
