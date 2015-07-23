class Camera implements MenuItem {
  String hello;
  State mainState;
  PImage pic;
  
  Camera(State mainState) {
    hello = "hello from camera.display();";
    this.mainState = mainState;
  }
  
  void display(){
    mainState.updateCameraImage();
    pic = mainState.getCameraImage();
    if(pic != null) {
      image(pic, 0 , 0);
    }    
  }
  
  void touched(int x,int y){
  }
  
  
}

//CAPTURE CLASS

