# Stopwatch

This is a not optimized way to generate precise up counter videos with a specific framerate.

Since it is not intended to be used multiple times (you generate a video and thats it), the script is a simple bash script that need to be edited to set some variable before run.

You must be capable of running a `bash` script and also **must** have in your path:

- ffmpeg
- inkscape
- bc (the bash calculator)

After script edition simple run `bash process.sh` and *wait... wait... wait...*

Some standard stopwatches were already generated and made available [here](https://xgvargas.github.io/kdenutil/)

## Variables

There are only 3 variables to set:

- `seconds` - the number of seconds to create the timer, like `60` for 1 minute, `300` for 5 minutes
- `fps` - fps of final video, `29.97`, `30`, etc.
- `full` - boolean to show complete clock or only the non 0 fields.
    - `false` -> `12.123`
    - `true` -> `0:00:12.123`

## Style

The best way to set your own style is to edit the `stopwatch.svg` file with some svg editor like `inkscape` and replace the original one.

## Tips

Remember that you will edit this video to overlay it on top of your original video. So, you don't need to generate different lengths videos, just create a single long one that counts up to a high number and then simple cut the end when doing the edition.

But **you MUST generate different video for different final framerate**.

If you are working on a project with 29.97fps then add a stopwatch with specifically 29.97fps framerate. If your video will be 30fps then used a 30fps stopwatch, came on, you got it right?
