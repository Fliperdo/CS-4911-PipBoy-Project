//change thingy
class Calorie implements MenuItem {
  String hello;
  int steps = 0;
  PFont f;
  State mainState;
  Button plus50;
  Button plus10;
  Button plus100;
  Button minus10;
  
  Calorie(State mainState) {
    hello = "hello from Calorie.display();";
    this.mainState = mainState;
    f = createFont( "Georgia" ,16,true);
    textFont(f);
    fill(0);
    int TLX = 100;
    int TLY = 350;
    int bO = 160;
    int buttonTextSize = 30;
    int buttonWidth = 150;
    plus10 = new Button(new Point(TLX, TLY), new Point(TLX + buttonWidth,TLY + 50), "+10 Cals", buttonTextSize);
    plus50 = new Button(new Point(TLX + bO, TLY), new Point(TLX + buttonWidth + bO, TLY + 50), "+50 Cals", buttonTextSize);
    plus100 = new Button(new Point(TLX + 2 * bO, TLY), new Point(TLX + buttonWidth + 2 * bO, TLY + 50), "+100 Cals", buttonTextSize);
    minus10 = new Button(new Point(TLX + 3 * bO, TLY), new Point(TLX + buttonWidth + 3 * bO, TLY + 50), "-10 Cals", buttonTextSize);

    //
    //
    
    //If we had one bit to count steps on the accelormeter we would only need one wire to communicate
    //that data! We just detect a change in order to count a step from the arduino!
    //This means, I can just have one variable in state that is counting the number of changes in read from there.
    
    //
    //
  }
  
  void display(){
//    println(hello);
    steps = mainState.getStepCount();
    textSize(40);
    text("Your step count is: " + steps, 100,300);
    text("Your calories burnt are: " + mainState.getCalories(), 100, 200);
    plus50.drawButton();
    plus100.drawButton();
    plus10.drawButton();
    minus10.drawButton();
  }
  
  void touched(int x,int y){
    if(plus50.wasClicked(x,y)) {
      mainState.addCalories(50);
      mainState.registerClick();
    }
    if(plus100.wasClicked(x,y)) {
      mainState.addCalories(100);
      mainState.registerClick();
    }
    if(plus10.wasClicked(x,y)) {
      mainState.addCalories(10);
      mainState.registerClick();
    }
    if(minus10.wasClicked(x,y)) {
      mainState.removeCalories(10);
      mainState.registerClick();
    }
  }
  
  
}

