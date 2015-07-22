class Calculator implements MenuItem {
  String hello;
  
  PFont f;
  
  Button zero;
  Button one;
  Button two;
  Button three;
  Button four;
  Button five;
  Button six;
  Button seven;
  Button eight;
  Button nine;

  Button equals;
  Button add;
  Button subtract;
  Button multiply;
  Button divide;
  Button clear;
  Button signChange;
  Button extraB;
  Button extraC;
  
  String op = "add";
  
  int displayNumber = 0;
  int numberBeforeOp = 0;
  
  int xOne = 275;
  int yOne = 150;
  int squareButtonSize = 50;
  int xTwo = xOne + squareButtonSize;
  int yTwo = yOne + squareButtonSize;
  
  int rowTwoOffset = 50;
  int rowThreeOffset = 100;
  int rowFourOffset = 150;
  int rowFiveOffset = 200;
  
  int columnTwoOffset = 50;
  int columnThreeOffset = 100;
  int columnFourOffset = 150;
  int columnFiveOffset = 200;
  PImage pic = loadImage("Calc Button.jpg");
  PImage pic2 = loadImage("Big Calc Button.jpg");
  PImage pic3 = loadImage("Huge Calc Button.jpg");
  PImage pic4 = loadImage("Massive Calc Button.jpg");
  Calculator(State mainState) {
    fill(0);
    f = createFont("Arial", 16 ,true); // Arial, 16 point, anti-aliasing on
    textFont(f);
    fill(color(0,255,123));
    stroke(color(0,255,123));
    hello = "hello from calc.display();";

    one =      new Button(new Point(xOne, yOne + columnThreeOffset),                  new Point(xTwo, yTwo + rowThreeOffset), "1", pic);
    two =      new Button(new Point(xOne + rowTwoOffset, yOne + rowThreeOffset),      new Point(xTwo + columnTwoOffset, yTwo + rowThreeOffset), "2", pic);
    three =    new Button(new Point(xOne + columnThreeOffset, yOne + rowThreeOffset), new Point(xTwo + columnThreeOffset, yTwo + rowThreeOffset), "3", pic);
    four =     new Button(new Point(xOne, yOne + rowTwoOffset),                       new Point(xTwo, yTwo + rowTwoOffset), "4", pic);
    five =     new Button(new Point(xOne + columnTwoOffset, yOne + rowTwoOffset),     new Point(xTwo + columnTwoOffset, yTwo + rowTwoOffset), "5", pic);
    six =      new Button(new Point(xOne + rowThreeOffset, yOne + columnTwoOffset),   new Point(xTwo + columnThreeOffset, yTwo + rowTwoOffset), "6", pic);
    seven =    new Button(new Point(xOne, yOne),                                      new Point(xTwo, yTwo), "7", pic);
    eight =    new Button(new Point(xOne + columnTwoOffset, yOne),                    new Point(xTwo + columnTwoOffset, yTwo), "8", pic);
    nine =     new Button(new Point(xOne + columnThreeOffset, yOne),                  new Point(xTwo + columnThreeOffset, yTwo), "9", pic);

    zero =     new Button(new Point(xOne, yOne + rowFourOffset), new Point(xTwo + rowThreeOffset, yTwo + rowFourOffset), "0", pic3);
    equals =   new Button(new Point(xOne + columnFourOffset, yOne + rowFourOffset), new Point(xTwo + columnFourOffset + columnTwoOffset, yTwo + rowFourOffset), "=", pic2);

    add =      new Button(new Point(xOne + columnFourOffset, yOne + rowTwoOffset),   new Point(xTwo + columnFourOffset, yTwo + rowTwoOffset), "+", pic);
    subtract = new Button(new Point(xOne + columnFourOffset, yOne + rowThreeOffset), new Point(xTwo + columnFourOffset, yTwo + rowThreeOffset), "-", pic);
    multiply = new Button(new Point(xOne + columnFiveOffset, yOne + rowTwoOffset),   new Point(xTwo + columnFiveOffset, yTwo + rowTwoOffset), "*", pic);
    divide =   new Button(new Point(xOne + columnFiveOffset, yOne + rowThreeOffset), new Point(xTwo + columnFiveOffset, yTwo + rowThreeOffset), "/", pic);
    clear =    new Button(new Point(xOne + columnFiveOffset, yOne),                  new Point(xTwo + columnFiveOffset, yTwo), "C", pic);
    signChange=new Button(new Point(xOne + columnFourOffset, yOne),                  new Point(xTwo + columnFourOffset, yTwo), "+/-", pic);

    extraB =   new Button(new Point(xOne, yOne), new Point(xTwo, yTwo));
    extraC =   new Button(new Point(xOne, yOne), new Point(xTwo, yTwo));

  }
  
  public void display(){

    one.drawButton();
    two.drawButton();
    three.drawButton();
    four.drawButton();
    five.drawButton();
    six.drawButton();
    seven.drawButton();
    eight.drawButton();
    nine.drawButton();
    equals.drawButton();
    add.drawButton();
    subtract.drawButton();
    multiply.drawButton();
    divide.drawButton();
    clear.drawButton();
    signChange.drawButton();
    zero.drawButton();
    fill(color(0,255,123));
    stroke(color(0,255,123));
    image(pic4, xOne - 1, yOne - 50 - 1);
    text(displayNumber, xOne + 10, yOne - 18); //light + 5 buffers
  }
  
  public void touched(int x,int y) {
    int digits = 10;
    for (int i = 0; i < digits; i++) {
      Button[] digitButtons = new Button[] { zero,one,two,three,four,five,six,seven,eight,nine };
      if(digitButtons[i].wasClicked(x,y)) {
        displayNumber = displayNumber * 10 + i;
        i = 10;
      }
    }
    if (multiply.wasClicked(x,y)) {
      numberBeforeOp = displayNumber;
      displayNumber = 0;
      op = "multiply";
    }
    if (divide.wasClicked(x,y)) {
      numberBeforeOp = displayNumber;
      displayNumber = 0;
      op = "divide";
    }
    if (add.wasClicked(x,y)) {
      numberBeforeOp = displayNumber;
      displayNumber = 0;
      op = "add";
    }
    if (subtract.wasClicked(x,y)) {
      numberBeforeOp = displayNumber;
      displayNumber = 0;
      op = "subtract";
    }
    if (signChange.wasClicked(x,y)) {
      displayNumber = -displayNumber;
    }
    if (clear.wasClicked(x,y)) {
      displayNumber = 0;
    }
    if (equals.wasClicked(x,y)) {
      if (op == "add") {
        displayNumber = numberBeforeOp + displayNumber;
      }
      if (op == "subtract") {
        displayNumber = numberBeforeOp - displayNumber;
      }
      if (op == "multiply") {
        displayNumber = numberBeforeOp * displayNumber;
      }
      if (op == "divide") {
        displayNumber = numberBeforeOp / displayNumber;
      }
    }

  }
  
  
}

