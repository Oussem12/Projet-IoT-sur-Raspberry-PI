import time
import paho.mqtt.client as mqtt

broker = "127.0.0.1"
temp_file = "/sys/class/hwmon/hwmon2/temp1_input"
topic = "temperature"

client = mqtt.Client()

def connected():
    print("Connected")

client.on_connect = connected
status = client.connect(broker)
if status != 0:
    print("Could not connect to broker")
    print(f"Error code: {status}")

while True:
    with open(temp_file, 'r') as f:
        temp = int(f.read()) / 1000
        status = client.publish(topic, temp)
        if status != 0:
            print(f"Could not publish data ! {status}")
        time.sleep(1)
