# Essentials

Packages that I search for in any development distribution

## Debian based

``` bash
sudo apt-get install mlocate build-essential bash-completion \
  # general dev
  gcc clang automake autoconf ncurses \
  jdk-openjdk \
  \ # building erlang
  libsctp-dev xsltproc
```

## Arch based

``` bash
sudo pacman -Syy mlocate base-devel bash-completion \
  # general dev
  gcc clang automake autoconf ncurses \
  jdk-openjdk \
  \ # building erlang
  lksctp-tools xsltproc
```

## Manual installs

