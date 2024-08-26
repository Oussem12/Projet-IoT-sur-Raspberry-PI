#!/bin/bash

AHT10_ADDR="0x38"
AHT10_DRIVER="aht10"
I2C_NEW_DEVICE="/sys/bus/i2c/devices/i2c-1/new_device"

for driver in i2c-bcm2708 i2c-dev aht10; do 
    if ! lsmod | grep -q $driver; then
        modprobe $driver || echo "Could not load $driver"
    fi
done

if echo ${AHT10_DRIVER} ${AHTH10_ADDR} > ${I2C_NEW_DEVICE}; then
    python3 aht10.py
else
    echo "Could not add new_device for ${AHT10_DRIVER}"
fi
