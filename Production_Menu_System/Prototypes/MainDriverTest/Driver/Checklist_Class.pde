class Checklist implements MenuItem {
  String hello;
  PFont f;
  int textSize = 12;
  String[] lines;
  String url;
  
  Checklist(State mainState) {
    hello = "hello from Checklist.display();";
    url = "Checklist.txt";
    lines = loadStrings(url);
    fill(0);
    f = createFont("Arial", textSize, true); // Arial, textSize point, anti-aliasing on
    textFont(f);
  }
  
  void display(){
    lines = loadStrings(url);
 //   println(hello);
    for (int i = 0; i < lines.length; i ++) {
      text(lines[i], 10, i*15 + 10);
    }
  }
  
  void touched(int x,int y){
  }
  
  //C:\Users\Fliperdo\Documents\GitHub\CS-4911-PipBoy-Project\Production_Menu_System\Prototypes\MainDriverTest\Driver\data
}

