#!/bin/bash

# Charger les modules nécessaires si non déjà chargés
if ! lsmod | grep -q i2c_dev; then
    modprobe i2c-dev
fi

if ! lsmod | grep -q i2c_bcm2708; then
    modprobe i2c-bcm2708
fi

# Charger le module aht10
modprobe aht10

# Ajouter le périphérique I2C
echo "aht10 0x38" > /sys/bus/i2c/devices/i2c-1/new_device

# Vérifier la détection des périphériques I2C
i2cdetect -l
i2cdetect -y 1

# Exécuter le script Python
python3 aht10.py


