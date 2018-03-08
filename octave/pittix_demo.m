SINUS=0;
TRIANGLE=1;
SAWTOOTH=2;
RECTANGLE=3;
NOISE=4;

s=pittix(440,0);
play(s);

s1=pittix(440,TRIANGLE); play(s1);
s2=pittix(440,SAWTOOTH); play(s2);
s3=pittix(440,RECTANGLE); play(s3);
s4=pittix(440,NOISE);play(s4);

play([s1,s2,s3,s4]);

% amplitude modulation
lfo=pittix(10);
play(s1.*lfo);
play(s2.*lfo);
play(s3.*lfo);
play(s4.*lfo);

s1=pittix(440,TRIANGLE); play(s1);
s2=pittix(523,SAWTOOTH); play(s2);
s3=pittix(587,RECTANGLE); play(s3);
s4=pittix(659,NOISE);play(s4);

play([s1,s2,s3,s4]);

% amplitude modulation
s4=pittix(2000,NOISE,3);play(s4);
lfo=pittix(10,SAWTOOTH,3);
play(s4.*lfo);
