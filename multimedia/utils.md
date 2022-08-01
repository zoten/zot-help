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
