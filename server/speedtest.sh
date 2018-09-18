#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Notice:
#     This script is run on local machine to test server speed.

SERVER=$1
PORT=$2
USER=$3

#touch ~/log_vps_speed_test.txt
echo "Speed Test with $SERVER..."

# Ping speed
echo "Pinging Server..."
ping -c 1 "$SERVER:$PORT"

# Speed of SSH connection
echo "Connecting SSH..."
time ssh "$USER:$SERVER" "exit"

# Speed of uploading/download file with local machine
# echo "Uploading..."
# time scp ~/scptest $SERVER:~/
# echo "Downloading..."
# time scp $SERVER:~/scptest ~/

# Speed of Downloading from Youtube
echo "Downloading from youtube..."
time youtube-dl --no-continue --proxy "localhost:1087" -f best,mp4 -o ~/speedtest "https://youtu.be/TO9TS4aGWL4"

# Internet speed of remote server 
#time ssh $SERVER "speedtest; exit"