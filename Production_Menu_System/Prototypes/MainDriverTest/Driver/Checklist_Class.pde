class Checklist implements MenuItem {
  String hello;
  
  Checklist(State mainState) {
    hello = "hello from Checklist.display();";
  }
  
  void display(){
    println(hello);
  }
  
  void touched(int x,int y){
  }
  
  
}

