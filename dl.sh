#!usr/bin/zsh

# youtube-dl formula

alias yd="youtube-dl -f '(webm[width <= 3840]) + (251/140/139)' -o '%(title)s - %(id)s - %(uploader)s - %(upload_date)s - %(resolution)s.%(ext)s' --all-subs --embed-subs --add-metadata -i"

#unspecifed formats - works better for downloading non webm video files (fallback)
alias ydb="youtube-dl -o '%(title)s - %(id)s - %(uploader)s - %(upload_date)s - %(resolution)s.%(ext)s' --all-subs --embed-subs --add-metadata -i"


# where you want to save the downloaded files (target folder)
tf="wjsn_mera"

echo "" >> ids | cat ids | while read id; \
do \
    yd https://youtu.be/$id || ydb https://youtu.be/$id; \
    ls | grep -i webm | while read video; do rclone copy $video redu:${tf} -P -v; rm $video; done
    ls | grep -i mkv | while read video; do rclone copy $video redu:${tf} -P -v; rm $video; done
    ls | grep -i mp4 | while read video; do rclone copy $video redu:${tf} -P -v; rm $video; done
done