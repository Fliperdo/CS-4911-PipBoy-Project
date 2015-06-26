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
  
  int xOne = 200;
  int yOne = 200;
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
  Calculator(State mainState) {
    fill(0);
    f = createFont("Arial", 16 ,true); // Arial, 16 point, anti-aliasing on
    textFont(f);
    hello = "hello from calc.display();";

    one =      new Button(new Point(xOne, yOne + columnThreeOffset),                  new Point(xTwo, yTwo + rowThreeOffset), "1");
    two =      new Button(new Point(xOne + rowTwoOffset, yOne + rowThreeOffset),      new Point(xTwo + columnTwoOffset, yTwo + rowThreeOffset), "2");
    three =    new Button(new Point(xOne + columnThreeOffset, yOne + rowThreeOffset), new Point(xTwo + columnThreeOffset, yTwo + rowThreeOffset), "3");
    four =     new Button(new Point(xOne, yOne + rowTwoOffset),                       new Point(xTwo, yTwo + rowTwoOffset), "4");
    five =     new Button(new Point(xOne + columnTwoOffset, yOne + rowTwoOffset),     new Point(xTwo + columnTwoOffset, yTwo + rowTwoOffset), "5");
    six =      new Button(new Point(xOne + rowThreeOffset, yOne + columnTwoOffset),   new Point(xTwo + columnThreeOffset, yTwo + rowTwoOffset), "6");
    seven =    new Button(new Point(xOne, yOne),                                      new Point(xTwo, yTwo), "7");
    eight =    new Button(new Point(xOne + columnTwoOffset, yOne),                    new Point(xTwo + columnTwoOffset, yTwo), "8");
    nine =     new Button(new Point(xOne + columnThreeOffset, yOne),                  new Point(xTwo + columnThreeOffset, yTwo), "9");

    zero =     new Button(new Point(xOne, yOne + rowFourOffset), new Point(xTwo + rowThreeOffset, yTwo + rowFourOffset), "0");
    equals =   new Button(new Point(xOne + columnFourOffset, yOne + rowFourOffset), new Point(xTwo + columnFourOffset + columnTwoOffset, yTwo + rowFourOffset), "=");

    add =      new Button(new Point(xOne + columnFourOffset, yOne + rowTwoOffset),   new Point(xTwo + columnFourOffset, yTwo + rowTwoOffset), "+");
    subtract = new Button(new Point(xOne + columnFourOffset, yOne + rowThreeOffset), new Point(xTwo + columnFourOffset, yTwo + rowThreeOffset), "-");
    multiply = new Button(new Point(xOne + columnFiveOffset, yOne + rowTwoOffset),   new Point(xTwo + columnFiveOffset, yTwo + rowTwoOffset), "*");
    divide =   new Button(new Point(xOne + columnFiveOffset, yOne + rowThreeOffset), new Point(xTwo + columnFiveOffset, yTwo + rowThreeOffset), "/");
    clear =    new Button(new Point(xOne + columnFiveOffset, yOne),                  new Point(xTwo + columnFiveOffset, yTwo), "C");
    signChange=new Button(new Point(xOne + columnFourOffset, yOne),                  new Point(xTwo + columnFourOffset, yTwo), "+/-");

    extraB =   new Button(new Point(xOne, yOne), new Point(xTwo, yTwo));
    extraC =   new Button(new Point(xOne, yOne), new Point(xTwo, yTwo));

  }
  
  public void display(){
    println(hello);
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
    line(xOne, yOne, xOne, yOne - 50);
    line(xOne, yOne - 50, xOne + 250, yOne - 50);
    line(xOne + 250, yOne - 50, xOne + 250, yOne);
    line(xOne, yOne, xOne + 250, yOne);
    text(displayNumber, xOne + 5, yOne - 5); //light + 5 buffers
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

