# pacman

## Add packages

``` bash
pacman -S <package_name>
```

## Remove packages

``` bash
pacman -R <package_name>
```

## Update all packages

``` bash
 sudo pacman -Syu
# allow downgrades
 sudo pacman -Syuu
```

## Search packages

``` bash
# S = search s = both name and description
# Search available packages
pacman -Ss smplayer
# Search installed packages
pacman -Qs smplayer 
```

## Update mirrors

``` bash
pacman-mirrors
```

