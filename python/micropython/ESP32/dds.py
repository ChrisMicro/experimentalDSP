# play sounds with a dds melody generator
#
# 2018 ChrisMicro, GPL3

import math
from machine import DAC
from machine import Pin
import time

def sound(frequency_Hz,duration):
  dac1 = DAC(Pin(25))
  dac2 = DAC(Pin(26))

  # create a buffer containing a sine-wave
  buf = bytearray(256)
  for i in range(len(buf)):
   buf[i] = 128 + int(127 * math.sin(2 * math.pi * i / len(buf)))

  dacOut=dac2.write #spped optimization
  l=len(buf)        #spped optimization
  lm1=(l-1)*l

  fs=91839

  numsamples=fs*duration
  factor=int(frequency_Hz*lm1/fs)
  
  index=0
  for n in range(numsamples):
    dacOut(buf[index>>8])
    index=index+factor

    if(index>=lm1):
      index=index=0

pitch={"A4":440, "AS4":466,"B4":494,"C5":523,"CS5":554,"D5":587,"DS5":622,"E5":659,"F5":698,"FS5":740,"G5":784,"GS5":831,"A5":880} 

sound(400,3)
sound(100,1)

time.sleep(1)

melody=('A4','B4','C5','D5','E5')  

for note in melody:                                                                                               
  sound(pitch[note],0.5) 


