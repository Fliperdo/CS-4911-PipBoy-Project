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
  boolean changeAMorFM = false;
  boolean channelUp = false;
  boolean channelDown = false;
  boolean nextSong = false;
  boolean prevSong = false;
  boolean playingMusic = false;
  Minim minim;
  AudioPlayer[] songs;
  PImage cameraImage;
  
  State() {
    hello = "hello from state.update()";
    assignSongs();
  }
  
  void update(){
    updatePageIndex();
    updateStepCount();
    updateCalories();
    updateRadio();
    updateMusic();
    updateCameraImage();
    //println(hello);
  }
  
  void updatePageIndex() {
    if (piConnected) {
    
    } else {
      //use key interrupts to update state.
    }
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
    if(piConnected) {
      //step = READ(pinForStep);
      //if step != oldStep {
        //stepCount++;
      //}
      //oldStep = step;
    } else {
      stepCount = 6969;
    }
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
      channelUp = false; 
    }
    if (channelDown) {
      println("Send channelDown code to Ard");
      channelDown = false;  
    }
    if (changeAMorFM) {
      println("Send alternateFM_AM code to Ard");
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
  
  
  void updateMusic() {
    if (nextSong) {

      channelUp = false; 
    }
    if (prevSong) {

      channelDown = false;  
    }
    if (playingMusic) {

      changeAMorFM = false;
    }
  }
    
  void nextSong() {
    nextSong = true;
  }
  
  void prevSong() {
    prevSong = true;
  }
  
  void playMusic() {
    playingMusic = true;
  }
  
  void pauseMusic() {
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
  
}

