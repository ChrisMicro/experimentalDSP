fab=48000;
f=440;

[wsig,fab]=wavread("aufnahme.wav");

n=1:3*fab;
ff=2;
#sig=round(sin(2*pi*f/fab.*n)*ff)/ff;
sig=round(wsig*ff)/ff;
sound(sig,fab);

pause(2);
ff=64;
#sig=round(sin(2*pi*f/fab.*n)*ff)/ff;
sig=round(wsig*ff)/ff;
sound(sig,fab);



