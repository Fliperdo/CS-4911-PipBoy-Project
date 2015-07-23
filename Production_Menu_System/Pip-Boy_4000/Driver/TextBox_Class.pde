class TextBox {
  Point topLeft;
  Point bottomRight;
  String innerText = "";
  int textSize = 24;
  PFont f = createFont("Arial",textSize,true); // Arial, 16 point, anti-aliasing on
   
  TextBox(Point topLeft, Point bottomRight, String text) {
    this.topLeft = topLeft;
    this.bottomRight = bottomRight;
    this.innerText = text;
    textFont(f);
  }
  
  Point getTopLeft() {
    return topLeft;
  }
  
  Point getBottomRight() {
    return bottomRight;
  }
  
  void drawTextBox() {
    textFont(f);
    fill(color(0,255,123));
    stroke(color(0,255,123));
    strokeWeight(4);
    line(topLeft.getX(), topLeft.getY(), topLeft.getX(), bottomRight.getY()); //line from top left to bottom left
    line(topLeft.getX(), topLeft.getY(), bottomRight.getX(), topLeft.getY()); //line from top left to top right
    line(bottomRight.getX(), bottomRight.getY(), bottomRight.getX(), topLeft.getY()); //line from bottom right to 
    line(bottomRight.getX(), bottomRight.getY(), topLeft.getX(), bottomRight.getY());
    text(innerText, ((topLeft.getX() + bottomRight.getX()) / 2) - (innerText.length() * textSize / 4), ((topLeft.getY() + bottomRight.getY()) / 2) + textSize /2);
    strokeWeight(1);
  }
  
  
}

