# yt-ch-dl
Download videos from youtube.com to a Linux VPS using [`youtube-dl`](https://github.com/ytdl-org/youtube-dl) and automatically move them to a remote storage using [`rclone`](https://rclone.org/).

# Background and use case
YouTube videos can be and are taken down either by the uploader or YouTube. If that happens access to that video is lost, at least in the canonical sense. One way to prevent this is download a copy of a video. To do this, I can use a virtual private server (VPS) from providers like Linode and run youtube-dl from there.

The $5/mo plan on Linode has 1 core CPU, 1GB RAM, 1TB transfer/mo, abnd 25GB storage. Running and Ubuntu server that will host youtube-dl is no problem with these specifications. Storing the downloaded files is a different problem. A fresh install of Ubuntu Server 20.04 leaves me with 20GB of free storage. That's not gonna cut it since a number of the videos I arcive is in 4K. A few minutes of 4K video can be around half a gigabyte. Following this stats, the 20GB would only be good for 40 4K videos.

## Solution to the storage problem
Luckily, I have a Google Drive which has unlimited storage. I'm not sure if this will last, but I'm going to maximize it for now. Connecting the VPS using `rclone` I have virtually unlimited storage for archiving videos.

## Why not just download it to my local machines?
I'm in a part of the Philippines where fast Internet connection is absurdly expensive. 😅 The plan is to keep the video files on Google Drive then slow sync them locally using `rclone`.

# What you should know

To get the most of this package, you should be comfortable with Linux, setting up a VPS, installing software packages, working with the terminal, and know to use youtube-dl and rclone.

# The scripts and ids
## list.sh
`list.sh` goes through a youtube channel and extracts video ids based on filters.

You can also use it without filters.
## dl.sh
`dl.sh` downloads and then moves the downloaded video files to a remote


# Dependencies
This package uses `youtube-dl` and `rclone` to download videos and from the VPS to a remote storage, respectively.

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
- ## Why don't you just use `rclone mount` to directly mount a remote directory/folder instead of moving the downloading video files afterwards?
  - I used to do this, but for some reason this way produces synced issues between the video and audio. This issue was not present while downloading and letting youtube-dl sync the files locally on the VPS first and then moving them to a remote storage.