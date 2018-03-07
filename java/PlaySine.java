package basics;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;

public class PlaySine {
	protected static final int SAMPLE_RATE = 44100;

	private SourceDataLine line;
	boolean SoundInterfaceIsOkFlag;
	
	public void open() 
	{
		final AudioFormat af = new AudioFormat(SAMPLE_RATE, 8, 1, true, true); // only 8 bit resolution
		
		try {
			line = AudioSystem.getSourceDataLine(af);
			line.open(af, SAMPLE_RATE);
			SoundInterfaceIsOkFlag=true;
		} catch (LineUnavailableException e) {
			System.out.println("error: audio output not available");
			e.printStackTrace();
			SoundInterfaceIsOkFlag=false;
		}

		line.start();		
	}
	
	public void close()
	{
		if(SoundInterfaceIsOkFlag){
			line.drain();
			line.close();
		}
	}

	void play( double frequency_Hz, double duration_sec	) 
	{
		if(SoundInterfaceIsOkFlag){


			byte amplitude=100; // 0..127
			
			Double bs=SAMPLE_RATE*duration_sec;
			int bufferSize = bs.intValue();
			byte[] signal = new byte[bufferSize];
			
			for(int n=0;n<bufferSize;n++) signal[n] = (byte) (Math.sin( 2 *  Math.PI / SAMPLE_RATE  * n *  frequency_Hz ) * amplitude);
			
			line.write(signal,0,bufferSize);	
		}
		
	}
	
	public static void main(String[] args) {
		
		PlaySine x= new PlaySine();
		
		x.open();
		x.play(440,1);
		x.play(880,1);		
		x.close();
		
	}

}
/* simpleSoundElements
 * © ChrisMicro 2018.
 *
 * This file is part of simpleSoundElements.
 *
 * simpleSoundElements is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * simple_GUI_elements is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with simple_GUI_elements.  If not, see <http://www.gnu.org/licenses/>.
 *
 * If you use simple_GUI_elements in public project you can inform me about this by e-mail,
 * of course if you want it.
 *
 * web-site: https://github.com/ChrisMicro
 */


