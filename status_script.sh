TO_EMAIL="blaskowski94@gmail.com"
IP=192.168.0.20
status=`cat status.txt`

ping $IP -c 3

if [ $? -eq 0 ]; then
   	echo "$IP rpi online"
	if [ "$status" != "ONLINE" ]; then
		echo "sending back online notification"
   		echo "ONLINE" > status.txt
     	echo "$IP rpi is back online" | mail -s "$IP was offline but is back online now" $TO_EMAIL
   	fi
   	currenttime=$(date +%H:%M)
  	if [[ "$currenttime" < "00:01" ]]; then
     	echo 'sending daily all is well email'
  		echo "all is well" | mail -s "$IP rpi is online" $TO_EMAIL
    fi
else
    echo "STATUS JOB FAILED, $IP IS OFFLINE"
	if [ "$status" != "OFFLINE" ]; then
		echo "sending offline notification"
		echo "OFFLINE" > status.txt
     	echo "$IP rpi is offline" | mail -s "$IP RPI DOWN" $TO_EMAIL
	fi
fi
