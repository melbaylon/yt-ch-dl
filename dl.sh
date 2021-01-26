#!usr/bin/zsh

alias yd="youtube-dl -f 'webm[width <= 3840] + 251' -o '%(title)s - %(id)s - %(uploader)s - %(upload_date)s - %(resolution)s.%(ext)s' --all-subs --embed-subs --add-metadata -i"

echo "" >> ids | cat ids | while read id; \
do \
    yd https://youtu.be/$id; \
    rclone copy *webm redu:wjsn_mera -P -v; \
    rm *webm; \
done
