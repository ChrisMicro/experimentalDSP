play(pittix(440));
play(pittix(880));

SINUS=0;
TRIANGLE=1;
SAWTOOTH=2;
RECTANGLE=3;
NOISE=4;

s1=pittix(440,TRIANGLE);
s2=pittix(440,SAWTOOTH);
s3=pittix(440,RECTANGLE);
s4=pittix(440,NOISE);

play([s1,s2,s3,s4]);
play([s3,s2,s1,s4]);