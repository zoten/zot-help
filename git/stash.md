# Git stash utilities

``` bash
https://stackoverflow.com/questions/2160638/how-can-i-format-patch-with-what-i-stash-away

# To stash the output in a file:
git stash show -p --color=never > my-patch-name.patch

# Verify patch looks good:
git apply --stat my-patch-name.patch

# Verify no errors:
git apply --check my-patch-name.patch

```
