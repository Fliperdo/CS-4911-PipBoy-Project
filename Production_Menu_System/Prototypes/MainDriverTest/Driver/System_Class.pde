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
    //Calendar refresh = new Calendar();
//    currentTime = new TextBox(new Point(width/2. height/2), new Point(width/2 + 100, height/2 + 100), refresh.HOUR + ":" + refresh.MINUTE + ":" + refresh.SECOND);
  }
  
  void touched(int x,int y){
  }
  
  
}

