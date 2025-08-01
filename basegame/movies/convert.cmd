ffmpeg -i output.avi "%date:~10,4%-%date:~4,2%-%date:~7,2% %time:~0,2%-%time:~3,2%-%time:~6,2%.mp4"
del output.avi