#!/bin/bash

TEMP_FILE="/sys/class/hwmon/hwmon2/temp1_input"
BROKER="127.0.0.1"
TOPIC="temperature"

while 1; do
    temp=$(cat ${TEMP_FILE})
    temp=$(($temp / 1000))
    mosquitt_pub -h ${BROKER} -t ${TOPIC} -m ${temp} || 
        echo "Could not send MQTT message!"
    sleep 1
done
