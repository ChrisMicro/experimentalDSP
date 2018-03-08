% octave version of the famous pittix oscillator
%
% signal = pittix( f_Hz, waveform, duration )
%
%  SINUS=0;
%  TRIANGLE=1;
%  SAWTOOTH=2;
%  RECTANGLE=3;
%  NOISE=4;
%

% 2018 ChrisMicro, GPL3

function sig = pittix( f_Hz, waveform, duration )

  if ~exist("f_Hz"),
    f=440;
  else
    f=f_Hz;
  end
  
  if ~exist("duration"), 
    duration=0.5; 
  end
  
  fs=44100;

  SINUS=0;
  TRIANGLE=1;
  SAWTOOTH=2;
  RECTANGLE=3;
  NOISE=4;

  if ~exist("waveform"),
    waveform=SINUS;
  end

  t=1/f;
  Ts=1/fs;
  phase=0;
  m=1/t;
  dphase=m*Ts;
  for n=1:duration*fs,
      sig(n)=phase;
      phase=phase+dphase;
      if(phase>1),
        phase=phase-1;
      end
  end
  
  s_old=0;
  
  %sig=zeros(duration*fs,1);
  for n=1:duration*fs,
    
    if (waveform==SINUS),
      sig(n)=sin(2*pi*sig(n));
    end
    
    if (waveform==TRIANGLE),
      s=sig(n);
      if(s<0.25),
        sig(n)=s*4;
      else
        if(s<0.75),
         sig(n)=2-s*4;
        else
          sig(n)=s*4-4;
        end
      end
    end
    
    if (waveform==SAWTOOTH),
      s=sig(n);
      if(s<0.5),
        sig(n)=s*2;
      else
        sig(n)=s*2-2;  
      end
    end
    
    if (waveform==RECTANGLE),
      s=sig(n);
      if(s<0.5),
        sig(n)=1;
      else
        sig(n)=-1;  
      end
    end

    if (waveform==NOISE),
      if(n>1),
        s=sig(n);
        if(abs( s-s_old ) > 0.5 ),
          sig(n)=rand(1,1)*2-1;
        else
          sig(n)=sig(n-1);  
        end
        s_old=s;
    end    
  end

end

