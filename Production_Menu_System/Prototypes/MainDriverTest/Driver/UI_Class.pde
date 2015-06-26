class UI {
  String hello;
  MenuItem[] entertainment;
  int entertainmentSize = 3;
  MenuItem[] tools;
  int toolsSize = 5;
  MenuItem[] stats;
  int statsSize = 3;
  State mainState;
  
  UI(State state) {
    hello = "hello from ui.disply";
    mainState = state;  
    entertainment = new MenuItem[] {new MP3(mainState), new Radio(mainState), new Camera(mainState)};
    stats = new MenuItem[] {new Weather(mainState), new System(mainState), new Calorie(mainState)};
    tools = new MenuItem[] {new Calendar(mainState), new Calculator(mainState), new Checklist(mainState), new Flashlight(mainState), new Map(mainState)};
  }
  
  void display() {

    MenuItem x = getCorrectPage();
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
