class MP3 implements MenuItem {
  String hello;
  Button skipForward;
  Button skipBackward;
  Button play;
  Button pause;
  State mainState;
  int buttonSize = 100;
  
  Point pausePlayTopLeft = new Point(165,300);
  Point skipBackTopLeft = new Point(pausePlayTopLeft.getX() + 150, 300);
  Point skipForwardTopLeft = new Point(pausePlayTopLeft.getX() + 300, 300);

  Point ppBR = new Point(pausePlayTopLeft.getX()   + buttonSize, pausePlayTopLeft.getY()   + buttonSize);
  Point sfBR = new Point(skipForwardTopLeft.getX() + buttonSize, skipForwardTopLeft.getY() + buttonSize);
  Point sbBR = new Point(skipBackTopLeft.getX()    + buttonSize, skipBackTopLeft.getY()    + buttonSize);
  
  MP3(State mainState) {
    hello = "hello from mp3.display();";
    this.mainState = mainState;
    skipForward      = new Button(skipForwardTopLeft, sfBR, ">>");
    skipBackward     = new Button(skipBackTopLeft, sbBR, "<<");
    play             = new Button(pausePlayTopLeft, ppBR, "|>");
    pause            = new Button(pausePlayTopLeft, ppBR, "||");
  }
  
  void display(){
    skipForward.drawButton();
    skipBackward.drawButton();
    if (mainState.isPlayingMusic()) {
      pause.drawButton();
    } else {
      play.drawButton();
    }
    textSize(30);
    text(songNames[mainState.currentSong % songNames.length], width/2 - songNames[mainState.currentSong % songNames.length].length() * 9, height/2);
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

