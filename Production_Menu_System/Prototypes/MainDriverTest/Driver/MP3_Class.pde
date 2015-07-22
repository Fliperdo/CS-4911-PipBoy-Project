class MP3 implements MenuItem {
  String hello;
  Button skipForward;
  Button skipBackward;
  Button play;
  Button pause;
  State mainState;
  
  int buttonSize = 100;
  int verticalPosition = 250;
  int vp = verticalPosition;
  
  Point pausePlayTopLeft = new Point(185,vp);
  Point skipBackTopLeft = new Point(pausePlayTopLeft.getX() + 150, vp);
  Point skipForwardTopLeft = new Point(pausePlayTopLeft.getX() + 300, vp);

  Point ppBR = new Point(pausePlayTopLeft.getX()   + buttonSize, pausePlayTopLeft.getY()   + buttonSize);
  Point sfBR = new Point(skipForwardTopLeft.getX() + buttonSize, skipForwardTopLeft.getY() + buttonSize);
  Point sbBR = new Point(skipBackTopLeft.getX()    + buttonSize, skipBackTopLeft.getY()    + buttonSize);
  
  PImage buttonsPic = loadImage("Calc Button Large.jpg");
  
  MP3(State mainState) {
    hello = "hello from mp3.display();";
    this.mainState = mainState;
    skipForward      = new Button(skipForwardTopLeft, sfBR, ">>", buttonsPic);
    skipBackward     = new Button(skipBackTopLeft, sbBR, "<<", buttonsPic);
    play             = new Button(pausePlayTopLeft, ppBR, "|>", buttonsPic);
    pause            = new Button(pausePlayTopLeft, ppBR, "||", buttonsPic);
  }
  
  void display(){
    skipForward.drawButton();
    skipBackward.drawButton();
    if (mainState.isPlayingMusic()) {
      pause.drawButton();
    } else {
      play.drawButton();
    }
    textSize(35);
    text(songNames[mainState.currentSong % songNames.length], width/2 - songNames[mainState.currentSong % songNames.length].length() * 10, height/2 - 50);
  }
  
  void touched(int x,int y){
    if (skipForward.wasClicked(x,y)) {
      mainState.nextSong();
    }
    if (skipBackward.wasClicked(x,y)) {
      mainState.prevSong();
    }
    if(!mainState.isPlayingMusic()) {
      if (play.wasClicked(x,y)) {
        mainState.playMusic();
      }
    } else {
      if (pause.wasClicked(x,y)) {
        mainState.pauseMusic();
      }
    }
  }
  
  
}

