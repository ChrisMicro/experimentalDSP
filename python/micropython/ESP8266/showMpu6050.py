from machine import I2C, Pin
import mpu6050
import time
import math

i2c = I2C(scl=Pin(5), sda=Pin(4))
accelerometer = mpu6050.accel(i2c)

def showMpu():
 while True:
  w=accelerometer.get_values()
  ax=w['AcX']
  ay=w['AcY']
  az=w['AcZ']
  gz=w['GyZ']
  gy=w['GyY']
  gx=w['GyX']
  temperature=w['Tmp']

  #absolute value in milli g
  a_mg=math.sqrt(ax*ax+ay*ay+az*az)/16.384
 
  print(a_mg)
  #print(ax,ay,az)
  #print(gx,gy,gz)
  time.sleep(0.1)


showMpu()

# you can use the Arduino IDE built in plotter to visualize the data
# baud=115200
