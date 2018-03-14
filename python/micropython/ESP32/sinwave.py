# f = 329Hz
# fs = 32.9kHz

import math
from machine import DAC
from machine import Pin

dac1 = DAC(Pin(25))
dac2 = DAC(Pin(26))

# create a buffer containing a sine-wave
buf = bytearray(100)
for i in range(len(buf)):
 buf[i] = 128 + int(127 * math.sin(2 * math.pi * i / len(buf)))

while 1:
 for i in range(len(buf)):
  dac2.write(buf[i])

