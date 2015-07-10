class Radio implements MenuItem {
  String hello;
  State mainState;
  Button channelUp;
  Button channelDown;
  Button changeToFM;
  Button changeToAM;
  String currentChannel;
  
  Radio(State mainState) {
    this.mainState = mainState;
    hello = "hello from radio.display();";
    channelUp = new Button(new Point(100,100), new Point(150,150), "CH_UP");
    channelDown = new Button(new Point(100, 155), new Point(150,205), "CH_DOWN");
    changeToFM = new Button(new Point(100,210), new Point(150,260), "FM");
    changeToAM = new Button(new Point(100,265), new Point(150,315), "AM");
  }
  
  void display() {
    channelUp.drawButton();
    channelDown.drawButton();
    changeToFM.drawButton();
    changeToAM.drawButton();
  }
  
  void touched(int x,int y){
    if (channelUp.wasClicked(x,y)) {
      mainState.channelUp();
    }
    if (channelDown.wasClicked(x,y)) {
      mainState.channelDown();
    }
    if (changeToFM.wasClicked(x,y)) {
      mainState.alternateAMorFM();
    }
    if (changeToAM.wasClicked(x,y)) {
      mainState.alternateAMorFM();
    }
  }
  
  
}

