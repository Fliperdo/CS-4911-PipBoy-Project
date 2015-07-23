class Radio implements MenuItem {
  String hello;
  State mainState;
  Button channelUp;
  Button channelDown;
  Button changeToFM;
  Button changeToAM;
  String currentChannel;
  
  int buttonHeight = 100;
  int buttonWidth = 200;
  int spaceBetweenButtons = 50;
  int topLeftPoint1X = width/2 - (buttonWidth + spaceBetweenButtons/2 );
  int topLeftPoint2X = topLeftPoint1X + buttonWidth + spaceBetweenButtons;
  int topLeftPoint3X = topLeftPoint1X;
  int topLeftPoint4X = topLeftPoint2X;

  int topLeftPoint1Y = 100;
  int topLeftPoint2Y = topLeftPoint1Y;
  int topLeftPoint3Y = topLeftPoint1Y + spaceBetweenButtons + buttonHeight;
  int topLeftPoint4Y = topLeftPoint3Y;
  
  PImage radioButtons = loadImage("radioButtons.jpg");

  Radio(State mainState) {
    this.mainState = mainState;
    hello = "hello from radio.display();";
    channelUp =   new Button(new Point(topLeftPoint1X, topLeftPoint1Y), new Point(topLeftPoint1X + buttonWidth, topLeftPoint1Y + buttonHeight), "CH_UP", radioButtons);
    channelDown = new Button(new Point(topLeftPoint2X, topLeftPoint2Y), new Point(topLeftPoint2X + buttonWidth, topLeftPoint2Y + buttonHeight), "CH_DOWN", radioButtons);
    changeToFM =  new Button(new Point(topLeftPoint3X, topLeftPoint3Y), new Point(topLeftPoint3X + buttonWidth, topLeftPoint3Y + buttonHeight), "FM", radioButtons);
    changeToAM =  new Button(new Point(topLeftPoint4X, topLeftPoint4Y), new Point(topLeftPoint4X + buttonWidth, topLeftPoint4Y + buttonHeight), "AM", radioButtons);
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

