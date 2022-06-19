TO_EMAIL="blaskowski94@gmail.com"
IP=192.168.0.20

ping $IP -c 3

if [ $? -eq 0 ]; then
   echo "$IP rpi online"
   currenttime=$(date +%H:%M)
   if [[ "$currenttime" < "00:01" ]]; then
     echo 'sending daily all is well email'
  	 echo "all is well" | mail -s "$IP rpi is online" $TO_EMAIL
   fi
else
   echo "STATUS JOB FAILED, $IP IS OFFLINE"
   echo "$IP rpi is offline" | mail -s "$IP RPI DOWN" $TO_EMAIL
fi
