#!/bin/bash

if ! lsmod | grep -q i2c_dev; then
    modprobe i2c-dev
fi

if ! lsmod | grep -q i2c_bcm2708; then
    modprobe i2c-bcm2708
fi
  modprobe aht10 lsmod | grep i2c lsmod | grep aht10 echo aht10 0x38 > /sys/bus/i2c/devices/i2c-1/new_device   
i2cdetect -l
i2cdetect -y 1
#!/bin/bash

if ! lsmod | grep -q i2c_dev; then
    modprobe i2c-dev
fi

if ! lsmod | grep -q i2c_bcm2708; then
    modprobe i2c-bcm2708
fi
  modprobe aht10 lsmod | grep i2c lsmod | grep aht10 echo aht10 0x38 > /sys/bus/i2c/devices/i2c-1/new_device   
i2cdetect -l
i2cdetect -y 1
  python3 aht10.py

