# GDB

## Enable history

```
echo 'set history save on' >> ~/.gdbinit && chmod 600 ~/.gdbinit
```

## Debug with gdb+valgrind

```
# From official guide
# http://valgrind.org/docs/manual/manual-core-adv.html

# Start valgrind server
valgrind --vgdb=yes --vgdb-error=0 prog
```

In another shell
```
# In another shell
gdb prog

# Inside gdb (if only one valgrind process is up)
target remote | vgdb
# If more processes
target remote | vgdb --pid=20865
```
