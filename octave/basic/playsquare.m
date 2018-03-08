f=440;
duration=0.5; 
fs=44100;

n=1:duration*fs;
sig=sign(sin(2*pi*f/fs.*n));

sound(sig,fs);



