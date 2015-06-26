class MP3 implements MenuItem {
  AudioPlayer firstSound;
  String hello;
  Button skipForward;
  Button skipBackward;
  Button play;
  Button pause;
  String currentSong;
  State mainState;
  
  MP3(State mainState) {
    firstSound = minim.loadFile("Fallout 3 Soundtrack Civilization (Bingo Bango Bongo)_bgDF2xfcbv8_youtube.mp3");
    hello = "hello from mp3.display();";
    this.mainState = mainState;
    skipForward      = new Button(new Point(150,100) , new Point(200,150), ">>");
    skipBackward     = new Button(new Point(150,155), new Point(200,205), "<<");
    play             = new Button(new Point(150,210) , new Point(200,260), "|>");
    pause            = new Button(new Point(150,210) , new Point(200,260), "||");
  }
  
  void display(){
    println(hello);
    skipForward.drawButton();
    skipBackward.drawButton();
    if (mainState.isPlayingMusic()) {
      pause.drawButton();
    } else {
      play.drawButton();
    }
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
        firstSound.play();
      }
    } else {
      if (pause.wasClicked(x,y)) {
        mainState.pauseMusic();
        firstSound.pause();
      }
    }
  }
  
  
}

