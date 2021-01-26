channel="https://www.youtube.com/channel/UCwS6H7jX50ldmB_IHxECvKw/videos"

# youtube-dl $channel --skip-download --match-title  '(아린 | 유아 | 비니)' --min-sleep-interval 5 --max-sleep-interval 10  --get-id -v -i | cat >> ids
youtube-dl $channel --skip-download --match-title  '(우주소녀)' --min-sleep-interval 5 --max-sleep-interval 10  --get-id -v -i | cat >> ids
