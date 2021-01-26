# CHANNEL
# you want to download from.
# You should be on the VIDEOS tab
# and the not on the HOME tab
# when copying the link.
channel="https://www.youtube.com/c/cs50/videos"

# FILTER
# This limits that video ids
# that is grabbed from the youtube channel.
# Multiple filters, example: '(Python|JavaScript|HTML)'
filter='(Python)'

# LISTER
# This goes through the videos
# of the youtube channel.
# If any part of the video title
# matches any of the filters,
# its video is added/appended to the ids file.
youtube-dl $channel --skip-download --match-title $filter --min-sleep-interval 5 --max-sleep-interval 10  --get-id -v -i | cat >> ids