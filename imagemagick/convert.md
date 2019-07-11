# Convert utility

## Convert all images in folder to pdf

First you need probably to remove (temporarily) usage restrictions

``` bash
# As explained here https://askubuntu.com/questions/1081895/trouble-with-batch-conversion-of-png-to-pdf-using-convert
sudo mv /etc/ImageMagick-6/policy.xml /etc/ImageMagick-6/policy.xmlout
```

``` bash
# cd into the source folder
for fname in *.psd; do convert $fname ./path/${fname%%.*}.pdf; done
```
