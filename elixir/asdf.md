# asdf and the BEAM

tips for using asdf with Erlang/Elixir

## REMEMBER

When changing versions to specific elixir/erlang/otp combination *remmeber* to update BOTH languages' version on asdf local, like

``` bash
# I want to use elixir 1.10.2-opt-22

asdf local elixir 1.10.2-opt-22
asdf local erlang 22.1.3   # erlang version name goes on with otp version
```

## Compiling Erlang

All my flags

### Erlang with wx

I had to do a couple  of horrible things, like

``` bash
  cd wxWidgets
 git submodule update --init src/png
 git submodule update --init src/jpeg
 ./configure --prefix=/usr/local --enable-webview 
 make && sudo make install
 sudo updatedb
 locate wx-config
 # /usr/local/bin/wx-config
```

### Compile flags

``` bash
export KERL_BUILD_DOCS=yes
export KERL_CONFIGURE_OPTIONS="--enable-threads  --enable-wx --with-wx-config=/usr/local/bin/wx-config --enable-sctp --enable-smp-support"
# --with-ssl=/opt/local
asdf install erlang 24.1.6
```
