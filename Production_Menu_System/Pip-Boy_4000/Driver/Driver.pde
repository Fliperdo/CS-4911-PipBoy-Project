import java.lang.management.*;
import ddf.minim.*;
import gifAnimation.*;
import processing.serial.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.text.SimpleDateFormat;
Serial myPort;
Minim minim;
AudioPlayer firstSong;
String song1Name = "Bingo Bango Bongo.mp3";
AudioPlayer secondSong;
String song2Name = "World On Fire.mp3";
AudioPlayer[] songs;
String[] songNames;

MainDriver PipBoyMenu;

void setup() 
{
    size(800,480);
    minim = new Minim(this);
    //need to handle case of no serial port
    //myPort = new Serial(this, Serial.list()[0], 9600);
    //println(Serial.list()[0]);
    PipBoyMenu = new MainDriver();
    firstSong = minim.loadFile(song1Name);
    secondSong = minim.loadFile(song2Name);
    songs = new AudioPlayer[] {firstSong, secondSong};
    songNames = new String[] {song1Name, song2Name};
}
void draw() 
{
  PipBoyMenu.drive();
}
class MainDriver {
  UI mainUI;
  Input mainInput;
  Output mainOutput;
  State mainState;
  
  MainDriver() {
    mainState = new State();
    mainUI = new UI(mainState);
    mainInput = new Input();
    mainOutput = new Output();
  }
  
  void drive() {
    mainInput.read();
    mainState.update();
    mainUI.display();
    mainOutput.write(); 
  }
  
  State getState(){
    return mainState;
  }
  
}

void keyPressed () {
  println(keyCode);
  PipBoyMenu.getState().updatePageIndex(keyCode);
}

void mousePressed() {
  PipBoyMenu.getState().click(mouseX, mouseY);
}

boolean sketchFullScreen() {
  return false;
}
