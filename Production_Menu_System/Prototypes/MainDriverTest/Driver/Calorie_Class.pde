//change thingy
class Calorie implements MenuItem {
  String hello;
  int steps = 0;
  PFont f;
  State mainState;
  Button plus50;
  
  Calorie(State mainState) {
    hello = "hello from Calorie.display();";
    this.mainState = mainState;
    f = createFont( "Georgia" ,16,true);
    textFont(f);
    fill(0);
    plus50 = new Button(new Point(50, 50), new Point(100,100));
    
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
    text("Your step count is: " + steps, 100, 40);
    text("Your calories burnt are: " + mainState.getCalories(), 200, 100);
    plus50.drawButton();
  }
  
  void touched(int x,int y){
    if(plus50.wasClicked(x,y)) {
      mainState.addCalories(50);
      mainState.registerClick();
    }
  }
  
  
}

