# yt-ch-dl
This project packages `youtube-dl` and `rclone` to apply automation in downloading and moving video files to a remote storage, in my case Google Drive. It contains select youtube-dl and rclone commands that were chosen for aforementioned purpose.

# Use case
You can use this


I decided to create this because I wanted a cheap and fast way to archive YouTube video files using a $5/mo VPS plan (1 Core CPU, 1 GB RAM, 25GB storage). As you can imagine, the 25GB storage is very limiting. But connecting it to a

I decided to create this because I need a way to archive a number of video files

# What you should know

To get the most of this package, you should be comfortable with Linux, setting up a VPS (virtual private server), installing software packages, working with the terminal, and know to use youtube-dl and rclone.

**This is not for beginners.**

# Dependencies
This package uses youtube-dl and rclone to download videos and from the VPS to a remote storage, respectively.

## youtube-dl
To install `youtube-dl`, you should install these first:
- python3
- pip3
- pip3 install youtube-dl

## rclone
Install rclone:
- See https://rclone.org/downloads/

Configure rclone to connect to your remote/cloud storage of choice
- https://rclone.org/docs/


# Additional notes
- Why don't you use `rclone mount` to directly mount a remote directory/folder instead of moving the downloading video files afterwards?
  - I used to do this, but for some reason this way produces synced issues between the video and audio. This issue was not present while downloading and letting youtube-dl sync the files locally on the VPS first and then moving them to a remote storage.