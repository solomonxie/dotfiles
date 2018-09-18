#! /bin/bash 
#
# Owner: Solomon Xie
# Email: solomonxiewise@gmail.com
# Notice:
#     This script is run on local machine to test server speed.

SERVERIP=$1

#touch ~/log_vps_speed_test.txt
echo "Speed Test with $SERVERIP..."

# Speed of SSH connection
time ssh ubuntu@$SERVERIP "exit"

# Speed of uploading/download file with local machine
time scp ~/scptest.jpg ubuntu@IP:~/
time scp ubuntu@$SERVERIP:~/scptest.jpg ~/

# Speed of connection to Youtube
time ssh ubuntu@$SERVERIP "ping -c 1 youtube.com; exit"

# Internet speed of remote server 
#time ssh ubuntu@$SERVERIP "speedtest; exit"