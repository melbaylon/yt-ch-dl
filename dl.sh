#!usr/bin/zsh

# YOUTUBE-DL COMMANDS
# Feel free to change this depending on the formats
# and resolution you want to download.
# This is optimized for downloading WEBM videos
alias yd="youtube-dl -f '(webm[width <= 3840]) + (251/140/139)' -o '%(title)s - %(id)s - %(uploader)s - %(upload_date)s - %(resolution)s.%(ext)s' --all-subs --embed-subs --add-metadata -i"

# This runs if the preferred formats, set by yd (above) is not available
alias ydb="youtube-dl -o '%(title)s - %(id)s - %(uploader)s - %(upload_date)s - %(resolution)s.%(ext)s' --all-subs --embed-subs --add-metadata -i"


# PATH TO REMOTE STORAGE
# Example: replace remote:downloaded-videos with gdrive:youtube-videos
# Refer to https://rclone.org/docs/
rs="remote:downloaded-videos"


# DOWNLOADER
# echo "" >> adds a blank line to ids file
# This makes sure that the last line of ids is downloaded
echo "" >> ids | cat ids | while read id;
do
    # If yd doesn't work, ydb will run
    # Generally, youtube-dl can process videos ids.
    # However, video ids that starts with a hyphen fails to download.
    # Passing in a complete video URL
    # using using https://youtu.be/$id
    # solves this problem.
    yd https://youtu.be/$id || ydb https://youtu.be/$id;

    # The following checks if webm, mkv or mp4 exists in the current directory.
    # If they are, the file is then copied to the remote storage path defined above.
    # After copying, the local file is deleted
    ls | grep -i webm | while read video; do rclone copy $video $rs -P -v; rm $video; done
    ls | grep -i mkv | while read video; do rclone copy $video $rs -P -v; rm $video; done
    ls | grep -i mp4 | while read video; do rclone copy $video $rs -P -v; rm $video; done

    # This while loop will run until all the video ids are processed
done