/*
  US modulatéd sender
  hardware:
    STM32F103 BluePill, 72Mhz
  Arduino Framework:
    STM32GENERIC

  Aug. 2017 ChrisMicro
*/

#include "HardwareTimer.h"

#define SOUNDPIN PB1

#define SIGNALLENGTH 24
uint8_t Signal[SIGNALLENGTH];
int SignalIndex = 0;

void interrupt()
{
  if (SignalIndex < SIGNALLENGTH)
  {
    digitalWrite(SOUNDPIN,Signal[SignalIndex]); 
    SignalIndex++;
  }
}

void setup()
{
  //Serial.begin(115200);

  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(SOUNDPIN, OUTPUT);

  // T=1/f = 1/40000
  int frequency_Hz = 40000;
  //Timer1.setPeriod(1000000/frequency_Hz/2); // half period interrupt
  Timer1.setPeriod(6); // 41.67khZ half period interrupt ( error of factor 2 in setPeriod )

  Timer1.attachInterrupt(interrupt);
  Timer1.resume();
}

void loop()
{

  digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN));

  for (int n = 0; n < SIGNALLENGTH; n++)
  {
    Signal[n] = n & 0x01; // zero degree phase signal
    //if(n<SIGNALLENGTH/2) Signal[n]=n & 0x01; // zero degree phase signal
    //else Signal[n]=(n-1) & 0x01; // 180 degree phase signal
  }
  SignalIndex = 0; // send new Signal
  delay(10);
  for (int n = 0; n < SIGNALLENGTH; n++)
  {
    //Signal[n]=n & 0x01; // zero degree phase signal
    if (n < SIGNALLENGTH / 2) Signal[n] = n & 0x01; // zero degree phase signal
    else Signal[n]=(n-1) & 0x01; // 180 degree phase signal

  }
  SignalIndex = 0; // send new Signal
  delay(10);
}
