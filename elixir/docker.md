# Elixir in docker

Tips for using elixir in docker/docker-compose/podman envs

## Observer, Quaff and other wx graphical tools

Linux

``` yaml
# ... docker-compose stuff
volumes:
  - ${HOME}/.Xauthority:/root/.Xauthority
  - /tmp/.X11-unix:/tmp/.X11-unix
environment:
  DISPLAY: ${DISPLAY}
```

## Histories

``` yaml
# ... docker-compose stuff
volumes:
  # bash history
  - "${PWD}/docker/.bash_history:/home/app/.bash_history:rw"
  # erl/elixir history
  - "${PWD}/docker/.erlang-history:/home/app/erlang-history:rw"
  - .:$PWD:delegated
environment:
  ERL_AFLAGS: "-kernel shell_history enabled -kernel shell_history_path '\"/home/app/erlang-history\"'"
```
