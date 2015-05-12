import ddf.minim.*;
import gifAnimation.*;
import com.pi4j.io.gpio.GpioController;
import com.pi4j.io.gpio.GpioFactory;
import com.pi4j.io.gpio.GpioPinDigitalInput;
import com.pi4j.io.gpio.PinPullResistance;
import com.pi4j.io.gpio.RaspiPin;


//GpioController gpio;
//GpioPinDigitalInput button1;
//GpioPinDigitalInput button2;
//GpioPinDigitalInput button3;
//GpioPinDigitalInput button4;


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

//MENU_IMAGE_ARRAYS
PImage[] MenuIntro_VerticalImages     ;
PImage[] Stats_Status_VerticalImages  ;
PImage[] Stats_SPECIAL_VerticalImages ;
PImage[] Stats_Skills_VerticalImages  ;
PImage[] Stats_Perks_VerticalImages   ;
PImage[] Stats_General_VerticalImages ;
PImage[] Items_Weapons_VerticalImages ;
PImage[] Items_Apparel_VerticalImages ;
PImage[] Items_Aid_VerticalImages     ;
PImage[] Items_Misc_VerticalImages    ;
PImage[] Items_Ammo_VerticalImages    ;
PImage[] Data_Localmap_VerticalImages ;
PImage[] Data_Worldmap_VerticalImages ;
PImage[] Data_Quests_VerticalImages   ;
PImage[] Data_Misc_VerticalImages     ;
PImage[] Data_Radio_VerticalImages    ;

//SIZE OF THOSE ARRAYS
int MenuIntro_NumExtraImages = 1;
int Stats_Status_NumExtraImages = 3;
int Stats_SPECIAL_NumExtraImages = 1;
int Stats_Skills_NumExtraImages = 1;
int Stats_Perks_NumExtraImages = 1;
int Stats_General_NumExtraImages = 1;
int Items_Weapons_NumExtraImages = 1;
int Items_Apparel_NumExtraImages = 1;
int Items_Aid_NumExtraImages = 1;
int Items_Misc_NumExtraImages = 1;
int Items_Ammo_NumExtraImages = 1;
int Data_Localmap_NumExtraImages = 1;
int Data_Worldmap_NumExtraImages = 1;
int Data_Quests_NumExtraImages = 1;
int Data_Misc_NumExtraImages = 1;
int Data_Radio_NumExtraImages = 1;

//Fill menus array;
MenuScreen[] menus = new MenuScreen[16];

int State = 0;
int Vertical_State = 0;
void draw()
{
 checkPushButtons(); 
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
 } 
 text(State, 770, 460);
 text(getVerticalPosition(), 770, 30);
}

MenuScreen getMenu(){
  return menus[State];
}

int getVerticalPosition() {
  return menus[State].getVertical();
}

void setVerticalPosition(int setToThis) {
  int a = menus[State].getVertical();
  int b = menus[State].getVerticalMax();
  if(setToThis > b - 1 || setToThis < 0) {
    //dont set it
  } else {
    menus[State].setVertical(setToThis);
  }
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
int ENTER = 10;
int Z = 90;
int X = 88;
int C = 67;
void keyPressed () {
  println(keyCode);
  println(State);
  if (keyCode == RIGHT) {
      //println(State);
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
   } else if (keyCode == ENTER) {
     updateState(ENTER);
   }
}
void keyReleased()
{

}

int Vertical_Selection = 0;
final int MAX_VERTICAL = 10;

void updateState(int changeDirection) {
  Vertical_Selection = getVerticalPosition();
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
      Vertical_Selection = 0;      
    }      
    if (changeDirection == X) {
      State = 6;
      Vertical_Selection = 0;
    }
    if (changeDirection == C) {
      State = 11;
      Vertical_Selection = 0;
    }
    if (changeDirection == UP) {
      setVerticalPosition(getVerticalPosition() - 1);
    }
    if (changeDirection == DOWN) {
      setVerticalPosition(getVerticalPosition() + 1);
    }
    if (changeDirection == ENTER) {
      //int position = getMenu().getVerticalPosition();
    }
}
void checkPushButtons(){
  if (button1.isHigh()) {
    //button 1 will be the right directional
    updateState(RIGHT);
    while(button1.isHigh()){}
  }
  if (button2.isHigh()) {
    //button 2 will be the left directional
    updateState(LEFT);
    while(button2.isHigh()){}
  }
  if (button3.isHigh()) {
    //button 3 will be the up directional
    updateState(UP);
    while(button3.isHigh()){}
  }
  if (button4.isHigh()) {
    //button 4 will be the down directional
    updateState(DOWN);
    while(button4.isHigh()){}
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
  int VerticalStateMax;
  int VerticalPosition = 0;
  AudioPlayer song;
  Gif animatedGif;
  PImage[] images;
  PImage background;
  
  
  MenuScreen(AudioPlayer asong, Gif aGif, PImage image, int VerticalMax, PImage[] menuImages) { 
    images = menuImages;
    VerticalStateMax = VerticalMax;
    song = asong;
    animatedGif = aGif;
    background = image;
  }

  //METHODS
  PImage getImage() {
    if (images == null) {
      return background;
    } else {
      return images[VerticalPosition];
    }
  }
  
  AudioPlayer getSong() {
    return song;
  }
  
  Gif getGIF() {
    return animatedGif;
  }
  
  int getVertical() {
    return VerticalPosition;
  }
  
  int getVerticalMax(){
    return VerticalStateMax;
  }
  
  void setVertical(int a) {
    VerticalPosition = a;
  }
}

void setup()
{
  size(800,480);
  minim = new Minim(this) ;
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  textFont(f,36);
  fill(255);
  
  setupGPIOS();
  
  //ASSIGNING PImages
  Intro_Screen        = loadImage(Intro_Screen_Name);
  Not_Implemented     = loadImage(NOT_IMPLEMENTED);
  RadioBackGround     = loadImage(RadioBG);
  
  setImageNames();
  
  //ASSIGNING VERTICAL IMAGES
  MenuIntro_VerticalImages = new PImage[MenuIntro_NumExtraImages];
  MenuIntro_VerticalImages[0] = Intro_Screen;
  Stats_Status_VerticalImages = new PImage[Stats_Status_NumExtraImages];
  Stats_Status_VerticalImages[0] = timageObject001;
  Stats_Status_VerticalImages[1] = timageObject003;
  Stats_Status_VerticalImages[2] = timageObject004;
  Stats_SPECIAL_VerticalImages = new PImage[Stats_SPECIAL_NumExtraImages];
  Stats_SPECIAL_VerticalImages[0] = Not_Implemented;
  Stats_Skills_VerticalImages = new PImage[Stats_Skills_NumExtraImages];
  Stats_Skills_VerticalImages[0] = Not_Implemented;
  Stats_Perks_VerticalImages = new PImage[Stats_Perks_NumExtraImages];
  Stats_Perks_VerticalImages[0] = Not_Implemented;
  Stats_General_VerticalImages = new PImage[Stats_General_NumExtraImages];
  Stats_General_VerticalImages[0] = Not_Implemented;
  Items_Weapons_VerticalImages = new PImage[Items_Weapons_NumExtraImages];
  Items_Weapons_VerticalImages[0] = Not_Implemented;
  Items_Apparel_VerticalImages = new PImage[Items_Apparel_NumExtraImages];
  Items_Apparel_VerticalImages[0] = Not_Implemented;
  Items_Aid_VerticalImages = new PImage[Items_Aid_NumExtraImages];
  Items_Aid_VerticalImages[0] = Not_Implemented;
  Items_Misc_VerticalImages = new PImage[Items_Misc_NumExtraImages];
  Items_Misc_VerticalImages[0] = Not_Implemented;
  Items_Ammo_VerticalImages = new PImage[Items_Ammo_NumExtraImages];
  Items_Ammo_VerticalImages [0] = Not_Implemented;
  Data_Localmap_VerticalImages = new PImage[Data_Localmap_NumExtraImages];
  Data_Localmap_VerticalImages[0] = Not_Implemented;
  Data_Worldmap_VerticalImages = new PImage[Data_Worldmap_NumExtraImages];
  Data_Worldmap_VerticalImages[0] = Not_Implemented;
  Data_Quests_VerticalImages = new PImage[Data_Quests_NumExtraImages];
  Data_Quests_VerticalImages[0] = Not_Implemented;
  Data_Misc_VerticalImages = new PImage[Data_Misc_NumExtraImages];
  Data_Misc_VerticalImages[0] = Not_Implemented;
  Data_Radio_VerticalImages = new PImage[Data_Radio_NumExtraImages];
  Data_Radio_VerticalImages[0] = RadioBackGround;
  
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


  //ASSIGNING MenuScreens        //AUDIO        GIF          IMAGE              Vertical Max                   ARRAY PIMAGES
  MenuIntro =     new MenuScreen(null         , null        ,Intro_Screen   ,   MenuIntro_NumExtraImages      ,MenuIntro_VerticalImages);
  Stats_Status =  new MenuScreen(null         , null        ,Not_Implemented,   Stats_Status_NumExtraImages   ,Stats_Status_VerticalImages);
  Stats_SPECIAL = new MenuScreen(null         , null        ,Not_Implemented,   Stats_SPECIAL_NumExtraImages  ,Stats_SPECIAL_VerticalImages);
  Stats_Skills =  new MenuScreen(null         , null        ,Not_Implemented,   Stats_Skills_NumExtraImages   ,Stats_Skills_VerticalImages);
  Stats_Perks =   new MenuScreen(null         , null        ,Not_Implemented,   Stats_Perks_NumExtraImages    ,Stats_Perks_VerticalImages);
  Stats_General = new MenuScreen(null         , null        ,Not_Implemented,   Stats_General_NumExtraImages  ,Stats_General_VerticalImages);
  Items_Weapons = new MenuScreen(null         , null        ,Not_Implemented,   Items_Weapons_NumExtraImages  ,Items_Weapons_VerticalImages);
  Items_Apparel = new MenuScreen(null         , null        ,Not_Implemented,   Items_Apparel_NumExtraImages  ,Items_Apparel_VerticalImages);
  Items_Aid =     new MenuScreen(null         , null        ,Not_Implemented,   Items_Aid_NumExtraImages      ,Items_Aid_VerticalImages);
  Items_Misc =    new MenuScreen(null         , null        ,Not_Implemented,   Items_Misc_NumExtraImages     ,Items_Misc_VerticalImages);
  Items_Ammo =    new MenuScreen(null         , null        ,Not_Implemented,   Items_Ammo_NumExtraImages     ,Items_Ammo_VerticalImages);
  Data_Localmap = new MenuScreen(null         , null        ,Not_Implemented,   Data_Localmap_NumExtraImages  ,Data_Localmap_VerticalImages);
  Data_Worldmap = new MenuScreen(null         , null        ,Not_Implemented,   Data_Worldmap_NumExtraImages  ,Data_Worldmap_VerticalImages);
  Data_Quests =   new MenuScreen(null         , null        ,Not_Implemented,   Data_Quests_NumExtraImages    ,Data_Quests_VerticalImages);
  Data_Misc =     new MenuScreen(null         , null        ,Not_Implemented,   Data_Misc_NumExtraImages      ,Data_Misc_VerticalImages);
  Data_Radio =    new MenuScreen(Radio_Music  , RadioGIF    ,RadioBackGround,   Data_Radio_NumExtraImages     ,Data_Radio_VerticalImages);
  
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

void setupGPIOS(){
  gpio = GpioFactory.getInstance();
  button1 = gpio.provisionDigitalInputPin(RaspiPin.GPIO_05, PinPullResistance.PULL_DOWN);
  button2 = gpio.provisionDigitalInputPin(RaspiPin.GPIO_06, PinPullResistance.PULL_DOWN);
  button3 = gpio.provisionDigitalInputPin(RaspiPin.GPIO_13, PinPullResistance.PULL_DOWN);
  button4 = gpio.provisionDigitalInputPin(RaspiPin.GPIO_19, PinPullResistance.PULL_DOWN);
}

void setImageNames() {
  timageObject001 = loadImage(timages001);
  timageObject002 = loadImage(timages002);
  timageObject003 = loadImage(timages003);
  timageObject004 = loadImage(timages004);
  timageObject005 = loadImage(timages005);
  timageObject006 = loadImage(timages006);
  timageObject007 = loadImage(timages007);
  timageObject008 = loadImage(timages008);
  timageObject009 = loadImage(timages009);
  timageObject010 = loadImage(timages010);
  timageObject011 = loadImage(timages011);
  timageObject012 = loadImage(timages012);
  timageObject013 = loadImage(timages013);
  timageObject014 = loadImage(timages014);
  timageObject015 = loadImage(timages015);
  timageObject016 = loadImage(timages016);
  timageObject017 = loadImage(timages017);
  timageObject018 = loadImage(timages018);
  timageObject019 = loadImage(timages019);
  timageObject020 = loadImage(timages020);
  timageObject021 = loadImage(timages021);
  timageObject022 = loadImage(timages022);
  timageObject023 = loadImage(timages023);
  timageObject024 = loadImage(timages024);
  timageObject025 = loadImage(timages025);
  timageObject026 = loadImage(timages026);
  timageObject027 = loadImage(timages027);
  timageObject028 = loadImage(timages028);
  timageObject029 = loadImage(timages029);
  timageObject030 = loadImage(timages030);
  timageObject031 = loadImage(timages031);
  timageObject032 = loadImage(timages032);
  timageObject033 = loadImage(timages033);
  timageObject034 = loadImage(timages034);
  timageObject035 = loadImage(timages035);
  timageObject036 = loadImage(timages036);
  timageObject037 = loadImage(timages037);
  timageObject038 = loadImage(timages038);
  timageObject039 = loadImage(timages039);
  timageObject040 = loadImage(timages040);
  timageObject041 = loadImage(timages041);
  timageObject042 = loadImage(timages042);
  timageObject043 = loadImage(timages043);
  timageObject044 = loadImage(timages044);
  timageObject045 = loadImage(timages045);
  timageObject046 = loadImage(timages046);
  timageObject047 = loadImage(timages047);
  timageObject048 = loadImage(timages048);
  timageObject049 = loadImage(timages049);
  timageObject050 = loadImage(timages050);
  timageObject051 = loadImage(timages051);
  timageObject052 = loadImage(timages052);
  timageObject053 = loadImage(timages053);
  timageObject054 = loadImage(timages054);
  timageObject055 = loadImage(timages055);
  timageObject056 = loadImage(timages056);
  timageObject057 = loadImage(timages057);
  timageObject058 = loadImage(timages058);
  timageObject059 = loadImage(timages059);
  timageObject060 = loadImage(timages060);
  timageObject061 = loadImage(timages061);
  timageObject062 = loadImage(timages062);
  timageObject063 = loadImage(timages063);
  timageObject064 = loadImage(timages064);
  timageObject065 = loadImage(timages065);
  timageObject066 = loadImage(timages066);
  timageObject067 = loadImage(timages067);
  timageObject068 = loadImage(timages068);
  timageObject069 = loadImage(timages069);
  timageObject070 = loadImage(timages070);
  timageObject071 = loadImage(timages071);
  timageObject072 = loadImage(timages072);
  timageObject073 = loadImage(timages073);
  timageObject074 = loadImage(timages074);
  timageObject075 = loadImage(timages075);
  timageObject076 = loadImage(timages076);
  timageObject077 = loadImage(timages077);
  timageObject078 = loadImage(timages078);
  timageObject079 = loadImage(timages079);
  timageObject080 = loadImage(timages080);
  timageObject081 = loadImage(timages081);
  timageObject082 = loadImage(timages082);
  timageObject083 = loadImage(timages083);
  timageObject084 = loadImage(timages084);
  timageObject085 = loadImage(timages085);
  timageObject086 = loadImage(timages086);
  timageObject087 = loadImage(timages087);
  timageObject088 = loadImage(timages088);
  timageObject089 = loadImage(timages089);
  timageObject090 = loadImage(timages090);
  timageObject091 = loadImage(timages091);
  timageObject092 = loadImage(timages092);
  timageObject093 = loadImage(timages093);
  timageObject094 = loadImage(timages094);
  timageObject095 = loadImage(timages095);
  timageObject096 = loadImage(timages096);
  timageObject097 = loadImage(timages097);
  timageObject098 = loadImage(timages098);
  timageObject099 = loadImage(timages099);
  timageObject100 = loadImage(timages100);
  timageObject101 = loadImage(timages101);
  timageObject102 = loadImage(timages102);
  timageObject103 = loadImage(timages103);
  timageObject104 = loadImage(timages104);
  timageObject105 = loadImage(timages105);
  timageObject106 = loadImage(timages106);
  timageObject107 = loadImage(timages107);
  timageObject108 = loadImage(timages108);
  timageObject109 = loadImage(timages109);
  timageObject110 = loadImage(timages110);
  timageObject111 = loadImage(timages111);
  timageObject112 = loadImage(timages112);
  timageObject113 = loadImage(timages113);
  timageObject114 = loadImage(timages114);
  timageObject115 = loadImage(timages115);
  timageObject116 = loadImage(timages116);
  timageObject117 = loadImage(timages117);
  timageObject118 = loadImage(timages118);
  timageObject119 = loadImage(timages119);
  timageObject120 = loadImage(timages120);
  timageObject121 = loadImage(timages121);
  timageObject122 = loadImage(timages122);
  timageObject123 = loadImage(timages123);
  timageObject124 = loadImage(timages124);
  timageObject125 = loadImage(timages125);
  timageObject126 = loadImage(timages126);
  timageObject127 = loadImage(timages127);
  timageObject128 = loadImage(timages128);
  timageObject129 = loadImage(timages129);
  timageObject130 = loadImage(timages130);
  timageObject131 = loadImage(timages131);
  timageObject132 = loadImage(timages132);
  timageObject133 = loadImage(timages133);
  timageObject134 = loadImage(timages134);
  timageObject135 = loadImage(timages135);
  timageObject136 = loadImage(timages136);
  timageObject137 = loadImage(timages137);
  timageObject138 = loadImage(timages138);
  timageObject139 = loadImage(timages139);
  timageObject140 = loadImage(timages140);
  timageObject141 = loadImage(timages141);
  timageObject142 = loadImage(timages142);
  timageObject143 = loadImage(timages143);
  timageObject144 = loadImage(timages144);
  timageObject145 = loadImage(timages145);
  timageObject146 = loadImage(timages146);
  timageObject147 = loadImage(timages147);
  timageObject148 = loadImage(timages148);
  timageObject149 = loadImage(timages149);
  timageObject150 = loadImage(timages150);
  timageObject151 = loadImage(timages151);
  timageObject152 = loadImage(timages152);
  timageObject153 = loadImage(timages153);
  timageObject154 = loadImage(timages154);
  timageObject155 = loadImage(timages155);
  timageObject156 = loadImage(timages156);
  timageObject157 = loadImage(timages157);
  timageObject158 = loadImage(timages158);
  timageObject159 = loadImage(timages159);
  timageObject160 = loadImage(timages160);
  timageObject161 = loadImage(timages161);
  timageObject162 = loadImage(timages162);
  timageObject163 = loadImage(timages163);
  timageObject164 = loadImage(timages164);
  timageObject165 = loadImage(timages165);
  timageObject166 = loadImage(timages166);
  timageObject167 = loadImage(timages167);
  timageObject168 = loadImage(timages168);
  timageObject169 = loadImage(timages169);
  timageObject170 = loadImage(timages170);
  timageObject171 = loadImage(timages171);
  timageObject172 = loadImage(timages172);
  timageObject173 = loadImage(timages173);
  timageObject174 = loadImage(timages174);
}


PImage timageObject001;
PImage timageObject002;
PImage timageObject003;
PImage timageObject004;
PImage timageObject005;
PImage timageObject006;
PImage timageObject007;
PImage timageObject008;
PImage timageObject009;
PImage timageObject010;
PImage timageObject011;
PImage timageObject012;
PImage timageObject013;
PImage timageObject014;
PImage timageObject015;
PImage timageObject016;
PImage timageObject017;
PImage timageObject018;
PImage timageObject019;
PImage timageObject020;
PImage timageObject021;
PImage timageObject022;
PImage timageObject023;
PImage timageObject024;
PImage timageObject025;
PImage timageObject026;
PImage timageObject027;
PImage timageObject028;
PImage timageObject029;
PImage timageObject030;
PImage timageObject031;
PImage timageObject032;
PImage timageObject033;
PImage timageObject034;
PImage timageObject035;
PImage timageObject036;
PImage timageObject037;
PImage timageObject038;
PImage timageObject039;
PImage timageObject040;
PImage timageObject041;
PImage timageObject042;
PImage timageObject043;
PImage timageObject044;
PImage timageObject045;
PImage timageObject046;
PImage timageObject047;
PImage timageObject048;
PImage timageObject049;
PImage timageObject050;
PImage timageObject051;
PImage timageObject052;
PImage timageObject053;
PImage timageObject054;
PImage timageObject055;
PImage timageObject056;
PImage timageObject057;
PImage timageObject058;
PImage timageObject059;
PImage timageObject060;
PImage timageObject061;
PImage timageObject062;
PImage timageObject063;
PImage timageObject064;
PImage timageObject065;
PImage timageObject066;
PImage timageObject067;
PImage timageObject068;
PImage timageObject069;
PImage timageObject070;
PImage timageObject071;
PImage timageObject072;
PImage timageObject073;
PImage timageObject074;
PImage timageObject075;
PImage timageObject076;
PImage timageObject077;
PImage timageObject078;
PImage timageObject079;
PImage timageObject080;
PImage timageObject081;
PImage timageObject082;
PImage timageObject083;
PImage timageObject084;
PImage timageObject085;
PImage timageObject086;
PImage timageObject087;
PImage timageObject088;
PImage timageObject089;
PImage timageObject090;
PImage timageObject091;
PImage timageObject092;
PImage timageObject093;
PImage timageObject094;
PImage timageObject095;
PImage timageObject096;
PImage timageObject097;
PImage timageObject098;
PImage timageObject099;
PImage timageObject100;
PImage timageObject101;
PImage timageObject102;
PImage timageObject103;
PImage timageObject104;
PImage timageObject105;
PImage timageObject106;
PImage timageObject107;
PImage timageObject108;
PImage timageObject109;
PImage timageObject110;
PImage timageObject111;
PImage timageObject112;
PImage timageObject113;
PImage timageObject114;
PImage timageObject115;
PImage timageObject116;
PImage timageObject117;
PImage timageObject118;
PImage timageObject119;
PImage timageObject120;
PImage timageObject121;
PImage timageObject122;
PImage timageObject123;
PImage timageObject124;
PImage timageObject125;
PImage timageObject126;
PImage timageObject127;
PImage timageObject128;
PImage timageObject129;
PImage timageObject130;
PImage timageObject131;
PImage timageObject132;
PImage timageObject133;
PImage timageObject134;
PImage timageObject135;
PImage timageObject136;
PImage timageObject137;
PImage timageObject138;
PImage timageObject139;
PImage timageObject140;
PImage timageObject141;
PImage timageObject142;
PImage timageObject143;
PImage timageObject144;
PImage timageObject145;
PImage timageObject146;
PImage timageObject147;
PImage timageObject148;
PImage timageObject149;
PImage timageObject150;
PImage timageObject151;
PImage timageObject152;
PImage timageObject153;
PImage timageObject154;
PImage timageObject155;
PImage timageObject156;
PImage timageObject157;
PImage timageObject158;
PImage timageObject159;
PImage timageObject160;
PImage timageObject161;
PImage timageObject162;
PImage timageObject163;
PImage timageObject164;
PImage timageObject165;
PImage timageObject166;
PImage timageObject167;
PImage timageObject168;
PImage timageObject169;
PImage timageObject170;
PImage timageObject171;
PImage timageObject172;
PImage timageObject173;
PImage timageObject174;

String timages001 = "2015-04-11_00001jpgjpg.jpg";
//                     2015-04-11_00001jpgjpg
String timages002 = "2015-04-11_00002jpgjpg.jpg";
String timages003 = "2015-04-11_00003jpgjpg.jpg";
String timages004 = "2015-04-11_00004jpgjpg.jpg";
String timages005 = "2015-04-11_00005jpgjpg.jpg";
String timages006 = "2015-04-11_00006jpgjpg.jpg";
String timages007 = "2015-04-11_00007jpgjpg.jpg";
String timages008 = "2015-04-11_00008jpgjpg.jpg";
String timages009 = "2015-04-11_00009jpgjpg.jpg";
String timages010 = "2015-04-11_00010jpgjpg.jpg";
String timages011 = "2015-04-11_00011jpgjpg.jpg";
String timages012 = "2015-04-11_00012jpgjpg.jpg";
String timages013 = "2015-04-11_00013jpgjpg.jpg";
String timages014 = "2015-04-11_00014jpgjpg.jpg";
String timages015 = "2015-04-11_00015jpgjpg.jpg";
String timages016 = "2015-04-11_00016jpgjpg.jpg";
String timages017 = "2015-04-11_00017jpgjpg.jpg";
String timages018 = "2015-04-11_00018jpgjpg.jpg";
String timages019 = "2015-04-11_00019jpgjpg.jpg";
String timages020 = "2015-04-11_00020jpgjpg.jpg";
String timages021 = "2015-04-11_00021jpgjpg.jpg";
String timages022 = "2015-04-11_00022jpgjpg.jpg";
String timages023 = "2015-04-11_00023jpgjpg.jpg";
String timages024 = "2015-04-11_00024jpgjpg.jpg";
String timages025 = "2015-04-11_00025jpgjpg.jpg";
String timages026 = "2015-04-11_00026jpgjpg.jpg";
String timages027 = "2015-04-11_00027jpgjpg.jpg";
String timages028 = "2015-04-11_00028jpgjpg.jpg";
String timages029 = "2015-04-11_00029jpgjpg.jpg";
String timages030 = "2015-04-11_00030jpgjpg.jpg";
String timages031 = "2015-04-11_00031jpgjpg.jpg";
String timages032 = "2015-04-11_00032jpgjpg.jpg";
String timages033 = "2015-04-11_00033jpgjpg.jpg";
String timages034 = "2015-04-11_00034jpgjpg.jpg";
String timages035 = "2015-04-11_00035jpgjpg.jpg";
String timages036 = "2015-04-11_00036jpgjpg.jpg";
String timages037 = "2015-04-11_00037jpgjpg.jpg";
String timages038 = "2015-04-11_00038jpgjpg.jpg";
String timages039 = "2015-04-11_00039jpgjpg.jpg";
String timages040 = "2015-04-11_00040jpgjpg.jpg";
String timages041 = "2015-04-11_00041jpgjpg.jpg";
String timages042 = "2015-04-11_00042jpgjpg.jpg";
String timages043 = "2015-04-11_00043jpgjpg.jpg";
String timages044 = "2015-04-11_00044jpgjpg.jpg";
String timages045 = "2015-04-11_00045jpgjpg.jpg";
String timages046 = "2015-04-11_00046jpgjpg.jpg";
String timages047 = "2015-04-11_00047jpgjpg.jpg";
String timages048 = "2015-04-11_00048jpgjpg.jpg";
String timages049 = "2015-04-11_00049jpgjpg.jpg";
String timages050 = "2015-04-11_00050jpgjpg.jpg";
String timages051 = "2015-04-11_00051jpgjpg.jpg";
String timages052 = "2015-04-11_00052jpgjpg.jpg";
String timages053 = "2015-04-11_00053jpgjpg.jpg";
String timages054 = "2015-04-11_00054jpgjpg.jpg";
String timages055 = "2015-04-11_00055jpgjpg.jpg";
String timages056 = "2015-04-11_00056jpgjpg.jpg";
String timages057 = "2015-04-11_00057jpgjpg.jpg";
String timages058 = "2015-04-11_00058jpgjpg.jpg";
String timages059 = "2015-04-11_00059jpgjpg.jpg";
String timages060 = "2015-04-11_00060jpgjpg.jpg";
String timages061 = "2015-04-11_00061jpgjpg.jpg";
String timages062 = "2015-04-11_00062jpgjpg.jpg";
String timages063 = "2015-04-11_00063jpgjpg.jpg";
String timages064 = "2015-04-11_00064jpgjpg.jpg";
String timages065 = "2015-04-11_00065jpgjpg.jpg";
String timages066 = "2015-04-11_00066jpgjpg.jpg";
String timages067 = "2015-04-11_00067jpgjpg.jpg";
String timages068 = "2015-04-11_00068jpgjpg.jpg";
String timages069 = "2015-04-11_00069jpgjpg.jpg";
String timages070 = "2015-04-11_00070jpgjpg.jpg";
String timages071 = "2015-04-11_00071jpgjpg.jpg";
String timages072 = "2015-04-11_00072jpgjpg.jpg";
String timages073 = "2015-04-11_00073jpgjpg.jpg";
String timages074 = "2015-04-11_00074jpgjpg.jpg";
String timages075 = "2015-04-11_00075jpgjpg.jpg";
String timages076 = "2015-04-11_00076jpgjpg.jpg";
String timages077 = "2015-04-11_00077jpgjpg.jpg";
String timages078 = "2015-04-11_00078jpgjpg.jpg";
String timages079 = "2015-04-11_00079jpgjpg.jpg";
String timages080 = "2015-04-11_00080jpgjpg.jpg";
String timages081 = "2015-04-11_00081jpgjpg.jpg";
String timages082 = "2015-04-11_00082jpgjpg.jpg";
String timages083 = "2015-04-11_00083jpgjpg.jpg";
String timages084 = "2015-04-11_00084jpgjpg.jpg";
String timages085 = "2015-04-11_00085jpgjpg.jpg";
String timages086 = "2015-04-11_00086jpgjpg.jpg";
String timages087 = "2015-04-11_00087jpgjpg.jpg";
String timages088 = "2015-04-11_00088jpgjpg.jpg";
String timages089 = "2015-04-11_00089jpgjpg.jpg";
String timages090 = "2015-04-11_00090jpgjpg.jpg";
String timages091 = "2015-04-11_00091jpgjpg.jpg";
String timages092 = "2015-04-11_00092jpgjpg.jpg";
String timages093 = "2015-04-11_00093jpgjpg.jpg";
String timages094 = "2015-04-11_00094jpgjpg.jpg";
String timages095 = "2015-04-11_00095jpgjpg.jpg";
String timages096 = "2015-04-11_00096jpgjpg.jpg";
String timages097 = "2015-04-11_00097jpgjpg.jpg";
String timages098 = "2015-04-11_00098jpgjpg.jpg";
String timages099 = "2015-04-11_00099jpgjpg.jpg";
String timages100 = "2015-04-11_00100jpgjpg.jpg";
String timages101 = "2015-04-11_00101jpgjpg.jpg";
String timages102 = "2015-04-11_00102jpgjpg.jpg";
String timages103 = "2015-04-11_00103jpgjpg.jpg";
String timages104 = "2015-04-11_00104jpgjpg.jpg";
String timages105 = "2015-04-11_00105jpgjpg.jpg";
String timages106 = "2015-04-11_00106jpgjpg.jpg";
String timages107 = "2015-04-11_00107jpgjpg.jpg";
String timages108 = "2015-04-11_00108jpgjpg.jpg";
String timages109 = "2015-04-11_00109jpgjpg.jpg";
String timages110 = "2015-04-11_00110jpgjpg.jpg";
String timages111 = "2015-04-11_00111jpgjpg.jpg";
String timages112 = "2015-04-11_00112jpgjpg.jpg";
String timages113 = "2015-04-11_00113jpgjpg.jpg";
String timages114 = "2015-04-11_00114jpgjpg.jpg";
String timages115 = "2015-04-11_00115jpgjpg.jpg";
String timages116 = "2015-04-11_00116jpgjpg.jpg";
String timages117 = "2015-04-11_00117jpgjpg.jpg";
String timages118 = "2015-04-11_00118jpgjpg.jpg";
String timages119 = "2015-04-11_00119jpgjpg.jpg";
String timages120 = "2015-04-11_00120jpgjpg.jpg";
String timages121 = "2015-04-11_00121jpgjpg.jpg";
String timages122 = "2015-04-11_00122jpgjpg.jpg";
String timages123 = "2015-04-11_00123jpgjpg.jpg";
String timages124 = "2015-04-11_00124jpgjpg.jpg";
String timages125 = "2015-04-11_00125jpgjpg.jpg";
String timages126 = "2015-04-11_00126jpgjpg.jpg";
String timages127 = "2015-04-11_00127jpgjpg.jpg";
String timages128 = "2015-04-11_00128jpgjpg.jpg";
String timages129 = "2015-04-11_00129jpgjpg.jpg";
String timages130 = "2015-04-11_00130jpgjpg.jpg";
String timages131 = "2015-04-11_00131jpgjpg.jpg";
String timages132 = "2015-04-11_00132jpgjpg.jpg";
String timages133 = "2015-04-11_00133jpgjpg.jpg";
String timages134 = "2015-04-11_00134jpgjpg.jpg";
String timages135 = "2015-04-11_00135jpgjpg.jpg";
String timages136 = "2015-04-11_00136jpgjpg.jpg";
String timages137 = "2015-04-11_00137jpgjpg.jpg";
String timages138 = "2015-04-11_00138jpgjpg.jpg";
String timages139 = "2015-04-11_00139jpgjpg.jpg";
String timages140 = "2015-04-11_00140jpgjpg.jpg";
String timages141 = "2015-04-11_00141jpgjpg.jpg";
String timages142 = "2015-04-11_00142jpgjpg.jpg";
String timages143 = "2015-04-11_00143jpgjpg.jpg";
String timages144 = "2015-04-11_00144jpgjpg.jpg";
String timages145 = "2015-04-11_00145jpgjpg.jpg";
String timages146 = "2015-04-11_00146jpgjpg.jpg";
String timages147 = "2015-04-11_00147jpgjpg.jpg";
String timages148 = "2015-04-11_00148jpgjpg.jpg";
String timages149 = "2015-04-11_00149jpgjpg.jpg";
String timages150 = "2015-04-11_00150jpgjpg.jpg";
String timages151 = "2015-04-11_00151jpgjpg.jpg";
String timages152 = "2015-04-11_00152jpgjpg.jpg";
String timages153 = "2015-04-11_00153jpgjpg.jpg";
String timages154 = "2015-04-11_00154jpgjpg.jpg";
String timages155 = "2015-04-11_00155jpgjpg.jpg";
String timages156 = "2015-04-11_00156jpgjpg.jpg";
String timages157 = "2015-04-11_00157jpgjpg.jpg";
String timages158 = "2015-04-11_00158jpgjpg.jpg";
String timages159 = "2015-04-11_00159jpgjpg.jpg";
String timages160 = "2015-04-11_00160jpgjpg.jpg";
String timages161 = "2015-04-11_00161jpgjpg.jpg";
String timages162 = "2015-04-11_00162jpgjpg.jpg";
String timages163 = "2015-04-11_00163jpgjpg.jpg";
String timages164 = "2015-04-11_00164jpgjpg.jpg";
String timages165 = "2015-04-11_00165jpgjpg.jpg";
String timages166 = "2015-04-11_00166jpgjpg.jpg";
String timages167 = "2015-04-11_00167jpgjpg.jpg";
String timages168 = "2015-04-11_00168jpgjpg.jpg";
String timages169 = "2015-04-11_00169jpgjpg.jpg";
String timages170 = "2015-04-11_00170jpgjpg.jpg";
String timages171 = "2015-04-11_00171jpgjpg.jpg";
String timages172 = "2015-04-11_00172jpgjpg.jpg";
String timages173 = "2015-04-11_00173jpgjpg.jpg";
String timages174 = "2015-04-11_00174jpgjpg.jpg";

