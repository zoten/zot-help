# Multimedia Utils

## Extract audio from video

### mplayer

``` bash
mplayer -dumpaudio -dumpfile output_filename.mp3 input.video_file.name
```

## Subtract audio from video

### ffmpeg

``` bash
ffmpeg -i $input_file -c copy -an $output_file
```

## Cut video and convert to gif

### ffmpeg

Jump the first 30 seconds (`-ss 30`) and make a gif 5 seconds long (`-t 5`)

``` bash
ffmpeg -ss 30 -t 5 -i input.mp4 -r 10 -f image2pipe -vcodec ppm - | convert -delay 10 -loop 0 -layers Optimize - output.gif
```
