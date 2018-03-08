fab=48000;
f=440;


n=1:3*fab;
ff=64;
sig=round(sin(2*pi*f/fab.*n)*ff)/ff;
sound(sig,fab);

pause(2);
ff=4096;
sig=round(sin(2*pi*f/fab.*n)*ff)/ff;
sound(sig,fab);

for n=1:10,
y(n)=sig(n);
end

