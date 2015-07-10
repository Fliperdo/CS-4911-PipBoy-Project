

//IF I CHANGE THE FILL OF THE TEXT BEFORE I TYPE IT A CAN MAKE THE ALPHA MAKE IT GLOW AND THUS MAKE COOL

class UI {
  String hello;
  MenuItem[] entertainment;
  int entertainmentSize = 3;
  MenuItem[] tools;
  int toolsSize = 5;
  MenuItem[] stats;
  int statsSize = 3;
  State mainState;
  PImage Background = loadImage("Background.jpg");
  PImage TaperedBorder = loadImage("TaperdGreenBorder.png");
  PImage SolidBorder = loadImage("SolidGreenBorder.png");
  
  UI(State state) {
    hello = "hello from ui.disply";
    mainState = state;
    image(Background, 0,0);  
    entertainment = new MenuItem[] {new MP3(mainState), new Radio(mainState), new Camera(mainState)};
    stats = new MenuItem[] {new System(mainState), new Calorie(mainState), new Weather(mainState)};
    tools = new MenuItem[] {new Calendar(mainState), new Calculator(mainState), new Checklist(mainState), new Flashlight(mainState), new Map(mainState)};
  }
  
  void display() {

    MenuItem x = getCorrectPage();
    image(Background, 0,0);
    fill(color(0,255,123));
    stroke(color(0,255,123));
    rect(25,20,750,5);
    rect(25,20,5,60);
    rect(25 + 750 -5,20,5,60);
    image(TaperedBorder, 25, 20);
    image(TaperedBorder, 25+750-5, 20);
    //The decision of what textbox Menu Name to display
    TextBox entertainmentTextBox = new TextBox(new Point(30 + 1, 25 + 1), new Point(300, 65), "Entertainment");
    TextBox statsTextBox = new TextBox(new Point(30 + 1, 25 + 1), new Point(150, 65), "Stats");
    TextBox toolsTextBox = new TextBox(new Point(30+ 1, 25+1), new Point(150, 65), "Tools");
    TextBox[] menuCategoryNames = new TextBox[]{statsTextBox, toolsTextBox, entertainmentTextBox};
    menuCategoryNames[mainState.getCurrentCategoryIndex()].drawTextBox();   
    x.display();
    if(mainState.hasClick()){
      x.touched(mainState.getClick().getX(), mainState.getClick().getY());
      mainState.registerClick();
    }
    //System.out.println(hello);
    //System.out.println(pipState.getCurrentPageIndex());
    //System.out.println(pipState.getCurrentCategoryIndex());
    //gets the current page index we are on from the state and calls display on it
  }
  
  MenuItem getCorrectPage() {
    int a = mainState.getCurrentPageIndex();
    int b = mainState.getCurrentCategoryIndex(); //We be deciding how to pick duh page
    if (b == 0 && (a > statsSize - 1)) {
      mainState.setCurrentPageIndex(0);
      a = mainState.getCurrentPageIndex();
    }
    if (b == 1 && (a > toolsSize - 1)) {
      mainState.setCurrentPageIndex(0);
      a = mainState.getCurrentPageIndex();
    }
    if (b == 2 && (a > entertainmentSize - 1)) {
      mainState.setCurrentPageIndex(0);
      a = mainState.getCurrentPageIndex();
    }
    if (a < 0) {
      mainState.setCurrentPageIndex(0); 
      a = mainState.getCurrentPageIndex();
    }
    if (b == 0) {
      return stats[a];
    }
    if (b == 1) {
      return tools[a];
    }
    if (b == 2) {
      return entertainment[a];
    }
    return null;
  }
}
