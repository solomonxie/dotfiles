#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Notice:
#     This script is run on local machine to test server speed.

SERVERIP=$1

#touch ~/log_vps_speed_test.txt
echo "Speed Test with $SERVERIP..."

# Speed of SSH connection
echo "Connecting SSH..."
time ssh ubuntu@$SERVERIP "exit"

# Speed of uploading/download file with local machine
echo "Uploading..."
time scp ~/scptest.jpg ubuntu@$SERVERIP:~/
echo "Downloading..."
time scp ubuntu@$SERVERIP:~/scptest.jpg ~/

# Speed of connection to Youtube
echo "Pinging youtube..."
time ssh ubuntu@$SERVERIP "ping -c 1 youtube.com; exit"

# Internet speed of remote server 
#time ssh ubuntu@$SERVERIP "speedtest; exit"