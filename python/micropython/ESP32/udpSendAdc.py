# use the ESP as access point remote measuremnt device
# 1. wait for a UDP request from the PC
# 2. send the ADC value to the PC

from machine import ADC
from machine import Pin
import network
import socket

port=1024

adc=ADC(Pin(36))

sta_if = network.WLAN(network.STA_IF)
ap_if = network.WLAN(network.AP_IF)
# acivate as access point
sta_if.active(True) 
# check the configuration
ap_if.ifconfig()

ip = ap_if.ifconfig()[0]
print(ip)
s=socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1) 
s.bind((ip,port))
print('waiting....')

counter=0
while True:
  data,addr=s.recvfrom(1024) # wait for message from udp partner
  value=adc.read()
  s.sendto(str(value),addr) # pong the response back
  counter=counter+1
  print('received:',data,'from',addr,'adc send:',value)

