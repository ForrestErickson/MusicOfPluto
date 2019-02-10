// MusicOfPluto
// By Forrest Lee Erickson
// 20190209
// developed from example at: https://processing.org/reference/libraries/sound/Sound.html

import processing.sound.*;
Sound s;

final float periodPlutoDay = 6.0*24*60*60 + 9.0*60*60 + 17.0*60+36; // From https://en.wikipedia.org/wiki/Pluto 
final float periodCharonMonth = 6.387*24*60*60 ; // From https://web.pa.msu.edu/people/horvatin/Astronomy_Facts/planet_pages/Plutos_moon.htm 
final float periodNixMonth = 24.9*24*60*60 ; // From https://web.pa.msu.edu/people/horvatin/Astronomy_Facts/planet_pages/Plutos_moon.htm 
final float periodHydraMonth = 38.2*24*60*60 ; // From https://web.pa.msu.edu/people/horvatin/Astronomy_Facts/planet_pages/Plutos_moon.htm
final float periodKerberosMonth = 32.1*24*60*60 ; // From https://web.pa.msu.edu/people/horvatin/Astronomy_Facts/planet_pages/Plutos_moon.htm 
final float periodStyxMonth = 20.2*24*60*60 ; // From https://web.pa.msu.edu/people/horvatin/Astronomy_Facts/planet_pages/Plutos_moon.htm
final float freqC3 = 130.8;
final int freqA4 = 440;

float freqPluto = 1/periodPlutoDay ;
float freqCharon = 1/periodCharonMonth ;
float freqNix = 1/periodNixMonth ;
float freqHydra = 1/periodHydraMonth ;
float freqKerberos = 1/periodKerberosMonth ;
float freqStyx = 1/periodStyxMonth ;

float freqScale = freqC3 * 1/freqHydra;  // Scale up for lowest frequency to hear it. 


void setup() {

  size(300, 300);
  //Scale frequencies 
  freqPluto = freqScale * freqPluto  ;
  freqCharon = freqScale * freqCharon ;
  freqNix = freqScale * freqNix;
  freqHydra = freqScale * freqHydra;
  freqKerberos = freqScale * freqKerberos;
  freqStyx = freqScale * freqStyx;

  // Play sine oscillators with frequency of planet and moons.
  SinOsc sin = new SinOsc(this);
  sin.play(freqPluto, 0.1);
  sin = new SinOsc(this);
  sin.play(freqCharon, 0.1);
  sin = new SinOsc(this);
  sin.play(freqNix, 0.1);
  sin = new SinOsc(this);
  sin.play(freqHydra, 0.1);
  sin = new SinOsc(this);
  sin.play(freqKerberos, 0.1);
  sin = new SinOsc(this);
  sin.play(freqStyx, 0.1);


  // Create a Sound object for globally controlling the output volume.
  s = new Sound(this);
  
//  println( "Our sound list is " + s.list());
//int deviceNumber = s.inputDevice();
//println( "Our input device list is %d", Sound.inputDevice());
  println ("\nMusic of the spheres for Pluto and its moons.");
  println ("FreqPluto is: " , freqPluto);
  println ("FreqCharon is: " , freqCharon);
  println ("FreqNix is: " , freqNix);
  println ("FreqHydra is: " , freqHydra);
  println ("FreqKerberos is: " , freqKerberos);
  println ("FreqStyx is: " , freqStyx);
  
}

void draw() {
   background(0);

  // Map vertical mouse position to volume.
  text("Move mouse vertically in window to change amplitude.", width/2-120, 150);
  float amplitude = map(mouseY, 0, height, 0.4, 0.0);

  // Instead of setting the volume for every oscillator individually, we can just
  // control the overall output volume of the whole Sound library.
  s.volume(amplitude);
}
