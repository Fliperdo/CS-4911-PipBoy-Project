import ddf.minim.*;
import gifAnimation.*;

//AUDIO FILE NAMES
String RadioSong = "Fallout 3 Soundtrack Civilization (Bingo Bango Bongo)_bgDF2xfcbv8_youtube.mp3";
String MenuTransitionSound = "Menu_Mode_Transition.wav";     //This changes the 5 inner menus
String EnterKey = "EnterKeySelect.wav";
String Radiation = "RadiationSounds.wav";
String Static_1 = "Transition_Static.wav";                       //The Statics Change Modes
String Static_2 = "Transition_Static_Loud_Random_1.wav";
String Static_3 = "Transition_Static_Loud_Random_2.wav";
String Static_4 = "Transition_Static_Loud_Random_3.wav";
String Static_5 = "Transition_Static_Loud_Random_4.wav";
String Scroll = "Scroll_Up_Down_Click.wav";

PFont f;

Minim minim;
//AUDIO FILE OBJECTS -- ASSIGNED IN SETUP
AudioPlayer Transition_Noise;
AudioPlayer Radio_Music;
AudioPlayer SubMode_Transition;
AudioPlayer Selection_Sound;
AudioPlayer Radiation_Sounds;
AudioPlayer Scroll_Up_Down_Click;
AudioPlayer Transition_Static_1;
AudioPlayer Transition_Static_2;
AudioPlayer Transition_Static_3;
AudioPlayer Transition_Static_4;
AudioPlayer Transition_Static_5;
AudioPlayer[] transitionStatics = new AudioPlayer[5];

int a = 1;

Gif loopingGif;

//GIF NAMES
String RadioAnimation = "RadioScreenGIF.gif";
//GIF OBJECTS
Gif RadioGIF;

//IMAGE NAMES
String Intro_Screen_Name = "Pip-Boy-StartScreen.png";
String NOT_IMPLEMENTED = "NON_IMPLEMENTED_SCREEN.jpg";
String RadioBG = "RadioScreenGIFBackground.jpg";

//IMAGE OBJECTS -- ASSIGNED IN SETUP
PImage Intro_Screen;
PImage Not_Implemented;
PImage RadioBackGround;

//PIXEL DIMENSIONS OF SCREEN - 800 X 480
int ScreenSize_Width = 800;
int ScreenSize_Height = 480;

//Menu_Objects
MenuScreen MenuIntro;
MenuScreen Stats_Status;
MenuScreen Stats_SPECIAL;
MenuScreen Stats_Skills;
MenuScreen Stats_Perks;
MenuScreen Stats_General;
MenuScreen Items_Weapons;
MenuScreen Items_Apparel;
MenuScreen Items_Aid;
MenuScreen Items_Misc;
MenuScreen Items_Ammo;
MenuScreen Data_Localmap;
MenuScreen Data_Worldmap;
MenuScreen Data_Quests;
MenuScreen Data_Misc;
MenuScreen Data_Radio;

//Fill menus array;
MenuScreen[] menus = new MenuScreen[16];


void setup()
{
  size(800,480);
  minim = new Minim(this) ;
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  textFont(f,36);
  fill(255);
  
  //ASSIGNING PImages
  Intro_Screen        = loadImage(Intro_Screen_Name);
  Not_Implemented     = loadImage(NOT_IMPLEMENTED);
  RadioBackGround     = loadImage(RadioBG);
  
  //ASSIGNING Gifs
  RadioGIF  = new Gif(this, RadioAnimation);
  
  //ASSIGNING Sounds
  Radio_Music           = minim.loadFile(RadioSong);
  SubMode_Transition    = minim.loadFile(MenuTransitionSound);
  Selection_Sound       = minim.loadFile(EnterKey);
  Radiation_Sounds      = minim.loadFile(Radiation);
  Scroll_Up_Down_Click  = minim.loadFile(Scroll);
  Transition_Static_1   = minim.loadFile(Static_1);
  Transition_Static_2   = minim.loadFile(Static_2);
  Transition_Static_3   = minim.loadFile(Static_3);
  Transition_Static_4   = minim.loadFile(Static_4);
  Transition_Static_5   = minim.loadFile(Static_5);
    transitionStatics[0] = Transition_Static_1;
    transitionStatics[1] = Transition_Static_2;
    transitionStatics[2] = Transition_Static_3;
    transitionStatics[3] = Transition_Static_4;
    transitionStatics[4] = Transition_Static_5;

  //ASSIGNING MenuScreens //AUDIO -- GIF -- IMAGE
  MenuIntro = new MenuScreen(null, null, Intro_Screen);
  Stats_Status = new MenuScreen(null, null, Not_Implemented);
  Stats_SPECIAL = new MenuScreen(null, null, Not_Implemented);
  Stats_Skills = new MenuScreen(null, null, Not_Implemented);
  Stats_Perks = new MenuScreen(null, null, Not_Implemented);
  Stats_General = new MenuScreen(null, null, Not_Implemented);
  Items_Weapons = new MenuScreen(null, null, Not_Implemented);
  Items_Apparel = new MenuScreen(null, null, Not_Implemented);
  Items_Aid = new MenuScreen(null, null, Not_Implemented);
  Items_Misc = new MenuScreen(null, null, Not_Implemented);
  Items_Ammo = new MenuScreen(null, null, Not_Implemented);
  Data_Localmap = new MenuScreen(null, null, Not_Implemented);
  Data_Worldmap = new MenuScreen(null, null, Not_Implemented);
  Data_Quests = new MenuScreen(null, null, Not_Implemented);
  Data_Misc = new MenuScreen(null, null, Not_Implemented);
  Data_Radio = new MenuScreen(Radio_Music, RadioGIF, RadioBackGround);
  
  //ASSIGNING MENU SCREENS
  menus [0] = MenuIntro;
  menus [1] = Stats_Status;
  menus [2] = Stats_SPECIAL;
  menus [3] = Stats_Skills;
  menus [4] = Stats_Perks;
  menus [5] = Stats_General;
  menus [6] = Items_Weapons;
  menus [7] = Items_Apparel;
  menus [8] = Items_Aid;
  menus [9] = Items_Misc;
  menus [10] = Items_Ammo;
  menus [11] = Data_Localmap;
  menus [12] = Data_Worldmap;
  menus [13] = Data_Quests;
  menus [14] = Data_Misc;
  menus [15] = Data_Radio;

//Sound1 = minim.loadFile(RadioSong);
//Sound2 = minim.loadFile(MenuTransitionSound);
//loopingGif = new Gif(this, "RadioScreenGIF.gif");  
}

int State = 0;
int Vertical_State = 0;
void draw()
{
 switch(State) {
  case 0: //MenuIntro
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 1: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 2: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 3: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }    break;
  case 4: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 5: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 6: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 7: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 8: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 9: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 10: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 11: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 12: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 13: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 14: 
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    break;
  case 15: //DataRadio
    image(getMenu().getImage(), 0, 0);
    if (getMenu().getSong() != null && !getMenu().getSong().isPlaying()) {
      getMenu().getSong().rewind();
      getMenu().getSong().play();
    }
    image(getMenu().getGIF(), 40, 20);
    getMenu().getGIF().loop();
    
    // Image[] temp = getMenu().getMenuImageArray();
    // temp[0].display();
    // 
    //
    //

 } 
 text(State, 770, 460);
}

MenuScreen getMenu(){
  return menus[State];
}

void stop()
{
 minim.stop() ;
 super.stop() ;
}

void mousePressed()
{

}
int LEFT  = 37;
int RIGHT = 39;
int UP    = 38;
int DOWN  = 40;
int Z = 90;
int X = 88;
int C = 67;
void keyPressed () {
  println(keyCode);
  println(State);
  if (keyCode == RIGHT) {
      println(State);
    updateState(RIGHT);
   } else if (keyCode == LEFT) {
     updateState(LEFT);
   } else if (keyCode == Z) {
    updateState(Z);
   } else if (keyCode == X) {
    updateState(X);
   } else if (keyCode == C) {
    updateState(C);
   } else if (keyCode == UP) {
    updateState(UP);
   } else if (keyCode == DOWN) {
    updateState(DOWN);
   }
}
void keyReleased()
{

}

int Vertical_Selection = 0;
final int MAX_VERTICAL = 10;

void updateState(int changeDirection) {
    playTransitionSounds(changeDirection);
    //transitionScreenNoise();
    if (changeDirection == RIGHT) {
      if(State != 5 && State != 10 && State != 15) {
        State = State + 1;
      } else {
        State = State - 4;
      }
    }
    if (changeDirection == LEFT) {
      if(State != 1 && State != 6 && State != 11 && State != 0 ) {
        State = State - 1;
      } else {
        State = State + 4;
      }
    }
    if (changeDirection == Z) {
      State = 1;
    }      
    if (changeDirection == X) {
      State = 6;
    }
    if (changeDirection == C) {
      State = 11;
    }
    if (changeDirection == UP) {
      if(Vertical_Selection != MAX_VERTICAL) {
        Vertical_Selection = Vertical_Selection + 1;
      }
    }
    if (changeDirection == DOWN) {
      if(Vertical_Selection != 0) {
        Vertical_Selection = Vertical_Selection - 1;
      }
    }
}

void playTransitionSounds(int changeType){
  if(changeType == RIGHT || changeType == LEFT) {
    SubMode_Transition.rewind();
    SubMode_Transition.play();
  }
  if(changeType == X || changeType == C || changeType == Z) {
    int rand = floor(random(0, 5));
    transitionStatics[rand].rewind();
    transitionStatics[rand].play(); 
  }
}
class MenuScreen { 
  AudioPlayer song;
  Gif animatedGif;
  PImage background;
  
  
  //DATA FIELDS

  // The Constructor is defined with arguments.
  MenuScreen(AudioPlayer asong, Gif aGif, PImage image) { 
    song = asong;
    animatedGif = aGif;
    background = image;
  }

  //METHODS
  PImage getImage() {
    return background;
  }
  
  AudioPlayer getSong() {
    return song;
  }
  
  Gif getGIF() {
    return animatedGif;
  }
  
}
