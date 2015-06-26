MainDriver PipBoyMenu;

void setup() {}
void draw() {}
class MainDriver {
  UI mainUI;
  Input mainInput;
  Output mainOutput;
  State mainState;
  
  MainDriver() {
    mainUI = new MainUI();
    mainInput = new MainInput();
    mainOutput = new MainOutput();
    mainState = new MainState();
  }
  
  void drive() {
    Input.read();
    State.update();
    UI.display();
    Output.write(); 
  }
}
