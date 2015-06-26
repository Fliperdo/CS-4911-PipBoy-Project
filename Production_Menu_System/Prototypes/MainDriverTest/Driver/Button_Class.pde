class Button {
  Point topLeft;
  Point bottomRight;
  String innerText = "";
  PFont f;
  int textSize = 12;
  
  Button(Point topLeft, Point bottomRight) {
    this.topLeft = topLeft;
    this.bottomRight = bottomRight;
  }
  
  Button(Point topLeft, Point bottomRight, String text) {
    this.topLeft = topLeft;
    this.bottomRight = bottomRight;
    this.innerText = text;
    fill(0);
    f = createFont("Arial",textSize,true); // Arial, 16 point, anti-aliasing on
    textFont(f);
  }
  
  Point getTopLeft() {
    return topLeft;
  }
  
  Point getBottomRight() {
    return bottomRight;
  }
  
  boolean wasClicked(int x, int y) {
    if (topLeft.getX() < x && topLeft.getY() < y && bottomRight.getX() > x && bottomRight.getY() > y) {
      return true;
    } else {
      return false;
    }
  }
  
  void drawButton() {
    line(topLeft.getX(), topLeft.getY(), topLeft.getX(), bottomRight.getY()); //line from top left to bottom left
    line(topLeft.getX(), topLeft.getY(), bottomRight.getX(), topLeft.getY()); //line from top left to top right
    line(bottomRight.getX(), bottomRight.getY(), bottomRight.getX(), topLeft.getY()); //line from bottom right to 
    line(bottomRight.getX(), bottomRight.getY(), topLeft.getX(), bottomRight.getY());
    text(innerText,topLeft.getX() + 1,topLeft.getY() + textSize + 1);
  }
  
  
}

