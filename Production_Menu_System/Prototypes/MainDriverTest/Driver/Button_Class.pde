class Button {
  Point topLeft;
  Point bottomRight;
  String innerText = "";
  int textSize = 18;
  PFont f = createFont("Arial",textSize,true); // Arial, 16 point, anti-aliasing on
  PImage pic;
  
  Button(Point topLeft, Point bottomRight) {
    this.topLeft = topLeft;
    this.bottomRight = bottomRight;
  }
  
  Button(Point topLeft, Point bottomRight, String text) {
    this.topLeft = topLeft;
    this.bottomRight = bottomRight;
    this.innerText = text;
  }
  
  Button(Point topLeft, Point bottomRight, String text, PImage pic) {
    this.topLeft = topLeft;
    this.bottomRight = bottomRight;
    this.innerText = text;
    this.pic = pic;
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
    textFont(f);
    fill(color(0,255,123));
    stroke(color(0,255,123));
    strokeWeight(2);
    //line(topLeft.getX(), topLeft.getY(), topLeft.getX(), bottomRight.getY()); //line from top left to bottom left
    //line(topLeft.getX(), topLeft.getY(), bottomRight.getX(), topLeft.getY()); //line from top left to top right
    //line(bottomRight.getX(), bottomRight.getY(), bottomRight.getX(), topLeft.getY()); //line from bottom right to 
    //line(bottomRight.getX(), bottomRight.getY(), topLeft.getX(), bottomRight.getY());
    if (pic != null) {
      image(pic, topLeft.getX(), topLeft.getY());
      text(innerText, ((topLeft.getX() + bottomRight.getX()) / 2) - (innerText.length() * textSize / 4), ((topLeft.getY() + bottomRight.getY()) / 2) + textSize /2);
    } else {
      line(topLeft.getX(), topLeft.getY(), topLeft.getX(), bottomRight.getY()); //line from top left to bottom left
      line(topLeft.getX(), topLeft.getY(), bottomRight.getX(), topLeft.getY()); //line from top left to top right
      line(bottomRight.getX(), bottomRight.getY(), bottomRight.getX(), topLeft.getY()); //line from bottom right to 
      line(bottomRight.getX(), bottomRight.getY(), topLeft.getX(), bottomRight.getY());
      text(innerText, ((topLeft.getX() + bottomRight.getX()) / 2) - (innerText.length() * textSize / 4), ((topLeft.getY() + bottomRight.getY()) / 2) + textSize /2);
    }
  }
  
  
}

