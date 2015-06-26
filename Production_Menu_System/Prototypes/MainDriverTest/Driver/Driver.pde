import java.lang.management.*;
import ddf.minim.*;
import gifAnimation.*;
Minim minim;

MainDriver PipBoyMenu;

void setup() 
{
    size(800,480);
    minim = new Minim(this);
    PipBoyMenu = new MainDriver();
}
void draw() 
{
  PipBoyMenu.drive();
}
class MainDriver {
  UI mainUI;
  Input mainInput;
  Output mainOutput;
  State mainState;
  
  MainDriver() {
    mainState = new State();
    mainUI = new UI(mainState);
    mainInput = new Input();
    mainOutput = new Output();
  }
  
  void drive() {
    mainInput.read();
    mainState.update();
    mainUI.display();
    mainOutput.write(); 
  }
  
  State getState(){
    return mainState;
  }
  
}

void keyPressed () {
  println(keyCode);
  PipBoyMenu.getState().updatePageIndex(keyCode);
}

void mousePressed() {
  println("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
  PipBoyMenu.getState().click(mouseX, mouseY);
}
