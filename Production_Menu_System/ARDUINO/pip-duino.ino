// NeoPixel Ring simple sketch (c) 2013 Shae Erisson
// released under the GPLv3 license to match the rest of the AdaFruit NeoPixel library

#include <Adafruit_NeoPixel.h>
#include <avr/power.h>
#include <SparkFunSi4703.h>
#include <Wire.h>

//radio pin consts
int resetPin = 3;
int SDIO = A4;
int SCLK = A5;

Si4703_Breakout radio(resetPin, SDIO, SCLK);
int channel;
int volume;
char rdsBuffer[10];

//flashlight consts
unsigned char MAX_RGB=100;
struct RGB{
  unsigned char r,g,b;
} r_col;
int party_it=0;

bool light_on = true;
bool ismute = true;
bool isparty = false;

// Neopixel output pin
#define PIN            2

// number of connected neopixels
#define NUMPIXELS      16

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

int delayval = 500; // delay for half a second

// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - r.
uint32_t Wheel(byte WheelPos) {
  WheelPos = 255 - WheelPos;
  if(WheelPos < 85) {
   return pixels.Color(255 - WheelPos * 3, 0, WheelPos * 3);
  } else if(WheelPos < 170) {
    WheelPos -= 85;
   return pixels.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  } else {
   WheelPos -= 170;
   return pixels.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
  }
}

void setup() {
  pixels.begin(); // This initializes the NeoPixel library.
    Serial.begin(9600);
  Serial.println("\n\nSi4703_Breakout Test Sketch");
  Serial.println("===========================");  
  Serial.println("a b     Favourite stations");
  Serial.println("+ -     Volume (max 15)");
  Serial.println("u d     Seek up / down");
  Serial.println("r       Listen for RDS Data (15 sec timeout)");
  Serial.println("Send me a command letter.");
  
  for(int i=0;i<NUMPIXELS;i++){
    pixels.setPixelColor(i, pixels.Color(0,50,0)); // Moderately bright green color.
    pixels.show(); // This sends the updated pixel color to the hardware.
  }

  radio.powerOn();
  radio.setVolume(15);
}

void loop() {

  /*
  * Arduino Output
  */
  
   //process accelerometer data and send step message to pi
   if(analogRead(A0)>500){
       Serial.println("STP"); 
   }
   //report radio station to pi
   Serial.print("CHN");
   Serial.println(channel);
   
   Serial.flush();


 /*
  * Arduino Input
  */

  //char *serbuf = (char*)malloc(10*sizeof(char));
  char serbuf[10];
   if (Serial.available()){
    Serial.readBytesUntil('\n', serbuf, 10);
//read rgb values from pi
    if (strncmp(serbuf, "RGB", 3) == 0 ){
      Serial.println("reaceived RGB");
      for(int i=0;i<NUMPIXELS;i++){
        r_col.r = (unsigned char) map(serbuf[3], 0, 255, 0, MAX_RGB);
        r_col.g = (unsigned char) map(serbuf[4], 0, 255, 0, MAX_RGB);
        r_col.b = (unsigned char) map(serbuf[5], 0, 255, 0, MAX_RGB);
        
        if(light_on){
          pixels.setPixelColor(i, pixels.Color(r_col.r, r_col.g, r_col.b)); 
        }else{
          pixels.setPixelColor(i, pixels.Color(0,0,0)); 
        }
      }
      pixels.show();
    } 
//read channel seek direction from pi
    else if(strncmp(serbuf, "CHS", 3) == 0){
      Serial.println("reaceived CHS");
      if(serbuf[3] == '+'){
        channel = radio.seekUp();
        displayInfo();
      }else if(serbuf[3] == '-'){
        channel = radio.seekDown();
        displayInfo();
      }
//read volume delta from pi
    }else if(strncmp(serbuf, "VOL", 3) == 0){
      Serial.println("reaceived VOL");
      if(serbuf[3] == '+'){
        volume ++;
        if (volume == 16) volume = 15;
      }else if(serbuf[3] == '-'){
        volume --;
        if (volume < 0) volume = 0;
      }
      if(ismute)
        radio.setVolume(0);
      else
        radio.setVolume(volume);
//read light on from pi
    }else if(strncmp(serbuf, "LON", 3) == 0){
      Serial.println("reaceived LON");
      light_on = true;
//read light off from pi
    }else if(strncmp(serbuf, "LOF", 3) == 0){
      Serial.println("reaceived LOF");
      light_on = false;
//read radio mute from pi
    }else if(strncmp(serbuf, "MUT", 3) == 0){
      Serial.println("reaceived MUT");
      ismute = !ismute;
//read party mode light pattern from pi
    }else if(strncmp(serbuf, "PMD", 3) == 0){
      Serial.println("reaceived PMD");
      isparty = !isparty;
//read brightness value from pi
    }else if(strncmp(serbuf, "BRT", 3) == 0){
      Serial.println("reaceived BRT");
      /*
      r_col.r = (unsigned char) map(r_col.r, 0, curr_brightness, 0, strcmp[3]);  
      r_col.g = (unsigned char) map(r_col.g, 0, MAX_RGB, 0, strcmp[3]);
      r_col.b = (unsigned char) map(r_col.b, 0, MAX_RGB, 0, strcmp[3]); 
      */
    }else if(strncmp(serbuf, "AFM", 3) == 0){
      Serial.println("reaceived AFM");
//no known am/fm command in radio module    
    }
    /*
    else if (ch == 'a')
    {
      channel = 930; // Rock FM
      radio.setChannel(channel);
      displayInfo();
    }
    else if (ch == 'r')
    {
      Serial.println("RDS listening");
      radio.readRDS(rdsBuffer, 15000);
      Serial.print("RDS heard:");
      Serial.println(rdsBuffer);      
    }
    */
  }
//update flashlight
  if(isparty){
    for(int i=0; i<pixels.numPixels(); i++) {
      pixels.setPixelColor(i, Wheel(((i * 256 / pixels.numPixels()) + party_it) & 255));
    }
    pixels.show();
    party_it = (party_it > 256*5)? 0 : ++party_it;
  }
}

void displayInfo()
{
   Serial.print("Channel:"); Serial.print(channel); 
   Serial.print(" Volume:"); Serial.println(volume); 
}
