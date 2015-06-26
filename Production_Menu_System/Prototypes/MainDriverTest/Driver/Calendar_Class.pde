class Calendar implements MenuItem {
  String hello;
  
  Calendar(State mainState) {
    hello = "hello from calendar.display();";
  }
  
  void display(){
    println(hello);
  }
  
  void touched(int x,int y){
  }
  
  
}

