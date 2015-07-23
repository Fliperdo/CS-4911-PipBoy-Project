class Flashlight implements MenuItem {
  String hello;
  State mainState;
  Button  lightOn; // =      
  Button  lightOff; // =    
  Button  brightnessUp; // =  
  Button brightnessDown; // = 
  Button  redUp; // =         
  Button  redDown; // =       
  Button  greenUp; // =       
  Button  greenDown; // =     
  Button  blueUp; // =        
  Button  blueDown; // =      
  Button[] allButtons;
  Button partyMode;
  
  PImage pic = loadImage("Calc Button Large.jpg");
  PImage pic2 = loadImage("Big Calc Button.jpg");
  
  Flashlight(State mainState) {
    hello = "hello from Flashlight.display();";
    this.mainState = mainState;
    int buttonSize = 100;
    int bS = buttonSize;
    int buttonOriginX = 140;
    int bOX = buttonOriginX;
    int buttonOriginY = 105;
    int bOY = buttonOriginY;
    int columnDiff = 50;
    lightOn =        new Button(new Point(bOX + bS * 0, bOY + bS * 0), new Point(bOX + bS * 1, bOY + bS * 1), "Vol+", pic);
    lightOff =      new Button(new Point(bOX + bS * 0, bOY + bS * 1), new Point(bOX + bS * 1, bOY + bS * 2), "Vol-", pic);
    brightnessUp =    new Button(new Point(bOX + bS * 1, bOY + bS * 0), new Point(bOX + bS * 2, bOY + bS * 1), "Bright+", pic);
    brightnessDown =  new Button(new Point(bOX + bS * 1, bOY + bS * 1), new Point(bOX + bS * 2, bOY + bS * 2), "Bright-", pic);
    redUp =           new Button(new Point(bOX + bS * 2, bOY + bS * 0), new Point(bOX + bS * 3, bOY + bS * 1), "R+", pic);
    redDown =         new Button(new Point(bOX + bS * 2, bOY + bS * 1), new Point(bOX + bS * 3, bOY + bS * 2), "R-", pic);
    greenUp =         new Button(new Point(bOX + bS * 3, bOY + bS * 0), new Point(bOX + bS * 4, bOY + bS * 1), "G+", pic);
    greenDown =       new Button(new Point(bOX + bS * 3, bOY + bS * 1), new Point(bOX + bS * 4, bOY + bS * 2), "G-", pic);
    blueUp =          new Button(new Point(bOX + bS * 4, bOY + bS * 0), new Point(bOX + bS * 5, bOY + bS * 1), "B+", pic);
    blueDown =        new Button(new Point(bOX + bS * 4, bOY + bS * 1), new Point(bOX + bS * 5, bOY + bS * 2), "B-", pic);
    
    partyMode =       new Button(new Point(337, 325), new Point(438, 375), "Party!", pic2);
    
    allButtons = new Button[] {lightOn, lightOff, brightnessUp, brightnessDown, redUp, redDown, greenUp, greenDown, blueUp, blueDown, partyMode};
  }
  
  void display() {
    for (int i = 0; i < allButtons.length; i++) {
      allButtons[i].drawButton();
    }
  //  println(hello);
  }
  
  void touched(int x,int y) {
    if (lightOn.wasClicked(x, y)) {
      mainState.lightOn();
    }
    if (lightOff.wasClicked(x, y)) {
      mainState.lightOff();
    }
    if (brightnessUp.wasClicked(x, y)) {
      mainState.lightBrightness(5);
    }
    if (brightnessDown.wasClicked(x, y)) {
      mainState.lightBrightness(-5);
    }
    if (redUp.wasClicked(x, y)) {
      mainState.redLevel(5);
    }
    if (redDown.wasClicked(x, y)) {
      mainState.redLevel(-5);      
    }
    if (greenUp.wasClicked(x, y)) {
      mainState.greenLevel(5);      
    }
    if (greenDown.wasClicked(x, y)) {
      mainState.greenLevel(-5);      
    }
    if (blueUp.wasClicked(x, y)) {
      mainState.blueLevel(5);      
    }
    if (blueDown.wasClicked(x, y)) {
      mainState.blueLevel(-5);      
    }
    if (partyMode.wasClicked(x, y)) {
      mainState.partyMode();
    }
  }
  
  
}

// I need an intensity up/down button
// I need a RGB color adjustor;


