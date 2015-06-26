class Flashlight implements MenuItem {
  String hello;
  
  Flashlight(State mainState) {
    hello = "hello from Flashlight.display();";
  }
  
  void display(){
    println(hello);
  }
  
  void touched(int x,int y){
  }
  
  
}

