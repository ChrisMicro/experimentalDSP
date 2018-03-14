import time
from socket import *

pings = 1000

#Create a UDP socket
clientSocket = socket(AF_INET, SOCK_DGRAM)
#Set a timeout value of 1 second
clientSocket.settimeout(1)

#Ping to server
message = 'test'

addr = ("192.168.4.1", 1024)
#Send ping
start = time.time()
counter = 0;
while pings > 0:
    message=str(counter)
    b = bytearray()
    b.extend(map(ord, message))

    clientSocket.sendto(b, addr)
    counter=counter+1

    #If data is received back from server, print 
    try:
        data, server = clientSocket.recvfrom(1024)
        end = time.time()
        elapsed = end - start
        print('number',counter,':',data)
      

    #If data is not received back from server, print it has timed out  
    except timeout:
        print('REQUEST TIMED OUT')

    pings = pings - 1
    time.sleep(0.1)
    
