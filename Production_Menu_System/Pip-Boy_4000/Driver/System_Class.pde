import java.lang.management.ManagementFactory;

class System implements MenuItem {
  String hello;
  MemoryMXBean memBean;
  RuntimeMXBean runBean;
  OperatingSystemMXBean osBean;
  TextBox upTime;
  TextBox startTime;
  TextBox heapUsage;
  TextBox javaVersion;
  TextBox systemLoadAvg;
  TextBox currentTime;
  
  System(State mainState) {
    hello = "hello from System.display();";
    memBean = ManagementFactory.getMemoryMXBean();
    runBean = ManagementFactory.getRuntimeMXBean();
    osBean = ManagementFactory.getOperatingSystemMXBean();
  }
  
  void display(){
//    println(memBean.getHeapMemoryUsage().getUsed()); //constantly incresing due to println s
//    println(runBean.getUptime()); // in miliseconds
//    println(runBean.getStartTime()); // in mili
//    println(runBean.getSpecVersion()); //1.7
//    println(osBean.getSystemLoadAverage());
//    println(hello);
    int topRightCornerX = 800 - 31;
    int topRightCornerY = 26;
    int heightOfTextBox = 40;
    int widthOfUptimeBox = 185;
    
    upTime = new TextBox(new Point(topRightCornerX - widthOfUptimeBox, topRightCornerY), new Point(topRightCornerX, topRightCornerY + heightOfTextBox), "Up Time: " + (runBean.getUptime()/1000/60) % 60 + ":" + (runBean.getUptime()/1000) % 60);
    upTime.drawTextBox();
    java.util.Calendar refresh = new GregorianCalendar();
    /*currentTime = new TextBox(new Point(400/2, 400/2), new Point(400/2 + 150, 400/2 + 50)*/
    textSize(80);
    text("" + Integer.toString(refresh.get(java.util.Calendar.HOUR)+12) + ":" + Integer.toString(refresh.get(java.util.Calendar.MINUTE)) + ":"  + Integer.toString(refresh.get(java.util.Calendar.SECOND)), width/2 -150, height/2 + 25);
//    currentTime.drawTextBox();
  }
  
  void touched(int x,int y){
  }
  
  
}

