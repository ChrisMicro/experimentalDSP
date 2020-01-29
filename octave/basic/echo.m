fs=44100;
s0=wavread("synthHC14.wav");
%s0=wavread("aufnahme.wav");

s=s0(:,1)';

%300,400,700

if 0,
d_ms=10;
a=0.5;

offset=round(fs/1000*d_ms/2)
s1=[s zeros(1,offset)];
s2=[zeros(1,offset) s ];
s=(s1*(1-a)+s2*a);
end
d_ms=300;
a=0.3;

offset=round(fs/1000*d_ms/2)
s1=[s zeros(1,offset)];
s2=[zeros(1,offset) s ];
s=(s1*(1-a)+s2*a);

d_ms=400;
a=0.2;

offset=round(fs/1000*d_ms/2)
s1=[s zeros(1,offset)];
s2=[zeros(1,offset) s ];
s=(s1*(1-a)+s2*a);

d_ms=700;
a=0.1;

offset=round(fs/1000*d_ms/2)
s1=[s zeros(1,offset)];
s2=[zeros(1,offset) s ];
s=(s1*(1-a)+s2*a);

sound(s,fs);

% wavwrite(s,fs,"s2.wav");
% lame -V4 synthHC14.wav 
