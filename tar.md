# You know you need this

## Creating Archives

``` bash
# Create a .tar archive
tar -cvf [archive].tar [file1] ...
```

``` bash
# Create a .tar.gz archive
tar -cvzf [archive].tar.gz [file1] ...
```

``` bash
# Create a .tar.bz2 archive
tar -cvjf [archive].tar.bz2 [file1] ...
```

## Extracting Archives

``` bash
# Extract a .tar archive to current directory
tar -xvf [archive].tar
```

``` bash
# Extract a .tar archive to target directory
tar -xvf [archive].tar -C /path/to/targetdirectory/
```

``` bash
# Extract a .tar.gz archive to current directory 
tar -xvzf [archive].tar.gz
```
