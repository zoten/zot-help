![image](https://github.com/zoten/zot-help/assets/8500195/78173220-1824-461e-b778-112eca5ee0f7)# GPU

## Which GPU is active?

``` bash
# glxinfo is available through mesa-utils
# sudo apt-get install mesa-utils
glxinfo | egrep "OpenGL vendor|OpenGL renderer"
```

e.g.

```
OpenGL vendor string: Intel
OpenGL renderer string: Mesa Intel(R) Xe Graphics (TGL GT2)
```

