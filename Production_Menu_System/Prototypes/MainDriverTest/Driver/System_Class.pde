import java.lang.management.ManagementFactory;

class System implements MenuItem {
  String hello;
  MemoryMXBean memBean;
  RuntimeMXBean runBean;
  OperatingSystemMXBean osBean;
  
  System(State mainState) {
    hello = "hello from System.display();";
    memBean = ManagementFactory.getMemoryMXBean();
    runBean = ManagementFactory.getRuntimeMXBean();
    osBean = ManagementFactory.getOperatingSystemMXBean();
  }
  
  void display(){
    println(memBean.getHeapMemoryUsage().getUsed()); //constantly incresing due to println s
    println(runBean.getUptime()); // in miliseconds
    println(runBean.getStartTime()); // in mili
    println(runBean.getSpecVersion()); //1.7
    println(osBean.getSystemLoadAverage());
    println(hello);
  }
  
  void touched(int x,int y){
  }
  
  
}

