class State {
  String hello;
  //Menu Item State
  int currentPageIndex = 0;
  int currentCategoryIndex = 0;
  boolean piConnected = false;
  int stepCount = 0;
  boolean step = false;
  boolean oldsStep = false;
  int caloriesBurnt = 0;
  int caloriesBurntFromStepsOld = 0;
  int caloriesBurntFromSteps = 0;
  boolean clickNoticed = true;
  Point click;
  String currentChannel = "";
  boolean changeAMorFM = false;
  boolean channelUp = false;
  boolean channelDown = false;
  boolean nextSong = false;
  boolean prevSong = false;
  boolean playingMusic = false;
  Minim minim;
  PImage cameraImage;
  boolean lightChanged = false;
  boolean isLightOn = false;
  int lightBrightness = 50;
  boolean changeOfColor = false;
  boolean changeOfBrightness;
  char redLevel = 100;
  char blueLevel = 100;
  char greenLevel = 100;
  int currentSong = 0;
  State() {
    hello = "hello from state.update()";
    assignSongs();
  }
  
  void update(){
    readSerialPort();
    updatePageIndex();
    updateStepCount();
    updateCalories();
    updateRadio();
    updateLight();
    //println(hello);
  }
  
  void readSerialPort() {
    if (myPort != null) {
    int newLine = 10; //ASCII
    String codeDataString = null;
    String myString;
    if (myPort.available() > 0) {
      myString = myPort.readStringUntil(newLine);
      if (myString != null) {
        println(myString);
        if (myString.contains("STP")) {
          stepCount++;
        } else if (myString.contains("CHN")) {
          String temp = myString.substring(3, 7); //definitely 3 -- CHN#
          String a = Character.toString(temp.charAt(0));
          String b = Character.toString(temp.charAt(1));
          String c = Character.toString(temp.charAt(2));
          String d = Character.toString(temp.charAt(3));
          if (temp.charAt(0) == '0')
          {            
            currentChannel = b +  c + "." + d;
          }
          else 
          {
            currentChannel = a + b + c + "." + d;
          }
          println(currentChannel);
        } else {
          println("Possible Read Error");
        }
      }
    }
    }
  }
  
  void updatePageIndex() {
    //can use key/button interupts here if hardware exists
  }
  int LEFT  = 37;
  int RIGHT = 39;
  int UP    = 38;
  int DOWN  = 40;  
  int ENTER = 10;
  int Z = 90;
  int X = 88;
  int C = 67;

  void updatePageIndex(int changeDirection) {
    //playTransitionSounds(changeDirection);
    //transitionScreenNoise();

    if (changeDirection == RIGHT) {
      currentPageIndex = currentPageIndex + 1;
    } else
    if (changeDirection == LEFT) {
      currentPageIndex = currentPageIndex - 1;
    } else 
    if (changeDirection == Z) {
      currentCategoryIndex = 0;
    } else
    if (changeDirection == X) {
      currentCategoryIndex = 1;
    } else
    if (changeDirection == C) {
      currentCategoryIndex = 2;
    } else {
      currentPageIndex = changeDirection;
    }
  }
  
  int getCurrentPageIndex() {
    return currentPageIndex;
  }
    
  int getCurrentCategoryIndex() {
    return currentCategoryIndex;
  }
    
  void setCurrentPageIndex(int a) {
    currentPageIndex = a;
  }
    
  void updateStepCount(){
  }
  
  void updateCalories(){
    caloriesBurntFromSteps = (stepCount / 100) * 5;
    caloriesBurnt = caloriesBurnt + (caloriesBurntFromSteps - caloriesBurntFromStepsOld);
    caloriesBurntFromStepsOld = caloriesBurntFromSteps;
  }
  
  int getStepCount(){
    return stepCount;
  }

  
  int getSteps() {
    return stepCount;
  }
  
  void addCalories(int cals) {
    caloriesBurnt = caloriesBurnt + cals;
  }
  
  void removeCalories(int cals) {
    caloriesBurnt -= cals;
  }
  
  void resetCalories() {
    caloriesBurnt = 0;
  }
  
  int getCalories(){
    return caloriesBurnt;
  }
  
  void registerClick() {
    clickNoticed = true;
  }
  
  void click(int x, int y) {
    click = new Point(x,y);
    clickNoticed = false;
  }
  
  boolean hasClick() {
    return !clickNoticed;
  }
  
  Point getClick() {
    return click;
  }
  
  //May need manager classes for each
  void updateRadio() {
    if (channelUp) {
      println("Send channelUp code to Ard");
      if (myPort != null){myPort.write("CHS+\n");}
      channelUp = false; 
    }
    if (channelDown) {
      println("Send channelDown code to Ard");
      if (myPort != null){myPort.write("CHS-\n");}
      channelDown = false;  
    }
    if (changeAMorFM) {
      println("Send alternateFM_AM code to Ard");
      if (myPort != null){myPort.write("AFM\n");}
      changeAMorFM = false;
    }
  }
  
  void channelUp() {
    channelUp = true;
  }
  
  void channelDown() {
    channelDown = true;
  }
  
  void alternateAMorFM() {
    changeAMorFM = true;
  }
   
  void nextSong() {
    songs[currentSong % songs.length].pause();
    currentSong++;
    songs[currentSong % songs.length].rewind();    
    songs[currentSong % songs.length].play();    
  }
  
  void prevSong() {
    songs[currentSong % songs.length].pause();
    currentSong--;
    songs[currentSong % songs.length].rewind();    
    songs[currentSong % songs.length].play();    
  }
  
  void playMusic() {
    if (myPort != null){myPort.write("MUT\n");}
    println(currentSong % songs.length);
    songs[currentSong % songs.length].play();    
    playingMusic = true;
  }
  
  void pauseMusic() {
    if (myPort != null){myPort.write("MUT\n");}
    songs[currentSong % songs.length].pause();
    playingMusic = false;
  }
  
  boolean isPlayingMusic() {
    return playingMusic;
  }
  
  Minim getMinim() {
    return minim;
  }
  
  void assignSongs() {
  }
  
  void updateCameraImage() {
    println("Image from camera get");
  }
  
  PImage getCameraImage() {
    return null;
  }
  
  void updateLight() {
    if (lightChanged) {
      if (isLightOn) {
        if (myPort != null){myPort.write("LOF\n");}
      } else {
        if (!isLightOn) {
        if (myPort != null){myPort.write("LON\n");}
        }
        lightChanged = false;
      }
    }
    if (changeOfBrightness) {
      if (myPort != null){myPort.write("BRT" + char(lightBrightness) + "\n");}
      changeOfBrightness = false;
    }
    if (changeOfColor) {
      if (myPort != null) {myPort.write("RGB" + redLevel + greenLevel + blueLevel + "\n"); }//http://www.tutorialspoint.com/java/java_string_getbytes.htm
      changeOfColor = false;
    }
    //if light has changed on off send code
    //if RGB changed send RGB code change
    //if birghtness changed send RGB code change
  }
  
  void lightOn() {
    isLightOn = true;
    lightChanged = true;
  }
  
  void lightOff() {
    isLightOn = false;
    lightChanged = true;
  }
  
  void lightBrightness(int change) {
    lightBrightness = lightBrightness + change;
    if (lightBrightness > 100) {
      lightBrightness = 100;
    }
    if (lightBrightness < 0) {
      lightBrightness = 0;
    }
    changeOfBrightness = true;
  }
  
  void redLevel(int change) {
    redLevel =char( redLevel + char(change));
    if (redLevel > 255) {
      redLevel = 255;
    }
    if (redLevel < 0) {
      redLevel = 0;
    }
    changeOfColor = true;
  }    

  void blueLevel(int change) {
    blueLevel =char( blueLevel + (char) change);
    if (blueLevel > 255) {
      blueLevel = 255;
    }
    if (blueLevel < 0) {
      blueLevel = 0;
    }
    changeOfColor = true;
  }

  void greenLevel(int change) {
    greenLevel = char(greenLevel + change);
    if (greenLevel > 255) {
      greenLevel = 255;
    }
    if (greenLevel < 0) {
      greenLevel = 0;
    }
    changeOfColor = true;
  }  
  
  void partyMode() {
    if (myPort != null){myPort.write("PMD\n");}
  }
}

