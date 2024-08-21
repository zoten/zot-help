# CLI

Hints or helpers for using the ~horrible~wonderful AWS CLI

## Switch profile

Edit your `~/.bashrc` / `~/.zshrc` file adding

``` bash
alias switch_aws_profile='eval export AWS_PROFILE=$(grep --color=none -oP "(?<=\[profile )[^]]+(?=])" ~/.aws/config | sort | fzf --height=6)'
```
