f=440;
duration=0.5; 
fs=44100;

n=1:duration*fs;
a=fs/f;
sig=(rem(n,a)/a)*2-1;

sound(sig,fs);

resulting_frequency_Hz=fs/round(a)



