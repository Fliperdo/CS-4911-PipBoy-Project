class Weather implements MenuItem {
  String hello;
  WeatherGrabber wg;
  String weather;
  int temp;
  PFont f;
  
  Weather(State mainState) {
    hello = "hello from Weather.display();";
    wg = new WeatherGrabber();
    f = createFont( "Georgia" ,16,true);
    textFont(f);
    fill(0);
  }
  
  void display(){
    //println(hello);
    wg.requestWeather();
    weather = wg.getWeather();
    temp = wg.getTemp();
    text(wg.getZip(),10,160);
    text(weather,10,90);
    text(temp,10,40);
  }
  
  void touched(int x,int y){
  }
  
  
}

class WeatherGrabber {
  
  int ipAddress;
  int temperature = 0;
  String weather = "";
  int zip;
  PFont f;
  boolean queriedBefore = false;
  int defaultZip = 30144;

  
  WeatherGrabber() {
    
  }
  
  // Set a new Zip code
  void setZip(int zip) {
    this.zip = zip;
  }
  
  // Get the temperature
  int getTemp() {
    return temperature;
  }
  
  int getZip() {
    return zip;
  }
  
  // Get the weather
  String getWeather() {
    return weather;
  }
  
  int getPO() {
    return ipAddress;
  }
  
  void getPostalNumber() {
    if(!queriedBefore) { 
      try {  
        String url = "http://ipinfo.io/json";
        String[] lines = loadStrings(url);
        if (lines == null) {
          throw new IOException();
        }
        String xml = join(lines, "" );
        String lookfor = "postal\": \"";
        String end = "\"";
        zip = int(giveMeTextBetween(xml,lookfor,end));
        queriedBefore = true;
      } catch (Exception e) {
        zip = defaultZip;
      }
    }
  }
  
  // Make the actual XML request
  void requestWeather() {
    getPostalNumber();
    String url = "http://xml.weather.yahoo.com/forecastrss?p=" + zip;
    String[] lines;
    try {
      lines = loadStrings(url);
    } catch (Exception e) {
      return; //we cant access the internet
    }
    // Turn array into one long String
    if (lines != null) {
      String xml = join(lines, "" ); 
    
      // Searching for weather condition
      String lookfor = "<yweather:condition  text=";
      String end = "\"";
      weather = giveMeTextBetween(xml,lookfor,end);
    
      // Searching for temperature
      lookfor = "temp=\"";
      temperature = PApplet.parseInt(giveMeTextBetween (xml,lookfor,end));
    }
  }
  
  // A function that returns a substring between two substrings
  String giveMeTextBetween(String s, String before, String after) {
    String found = "";
    int start = s.indexOf(before);    // Find the index of the beginning tag
    if (start == - 1) return"";       // If we don't find anything, send back a blank String
    start += before.length();         // Move to the end of the beginning tag
    int end = s.indexOf(after,start); // Find the index of the end tag
    if (end == -1) return"";          // If we don't find the end tag, send back a blank String
    return s.substring(start,end);    // Return the text in between
  }
  
}
