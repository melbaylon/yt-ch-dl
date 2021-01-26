# Link to the channel
# you want to download from.
# You should be on the VIDEOS tab
# and the not on the HOME tab
# when copying the link.
channel="https://www.youtube.com/c/cs50/videos"

# youtube-dl $channel --skip-download --match-title  '(아린 | 유아 | 비니)' --min-sleep-interval 5 --max-sleep-interval 10  --get-id -v -i | cat >> ids
youtube-dl $channel --skip-download --match-title  '(우주소녀)' --min-sleep-interval 5 --max-sleep-interval 10  --get-id -v -i | cat >> ids
