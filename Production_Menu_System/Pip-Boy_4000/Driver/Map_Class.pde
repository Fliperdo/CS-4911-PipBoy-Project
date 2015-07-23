class Map implements MenuItem {
  String hello;
  
  Map(State mainState) {
    hello = "hello from map.display();";
  }
  
  void display(){
    println(hello);
  }
  
  void touched(int x,int y){
  }
  
  
}

