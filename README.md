#CS-4911-PipBoy-Project - v0.3
Pip-Boy 4000 in real life.
This project seeks to implement a student rendition of a Pip-Boy 4000, a newer and more advanced Pip-Boy than the 3000 model. The project consists of hardware and software elements that are wide in scope and are meant for a computer science senior design project. While we feel the project is not hard to reduplicate, we may just not realize how much we have learned. Regardless, basic functionality can be accomplished with a touchscreen and a Raspberry PI 2.

##3D-Print
The 3d print is a redesign based on the model of Yvo de Haas at http://ytec3d.com/pip-boy/ . 
Our version was redesigned to house very specific hardware, mainly adjustments to accommodate a larger 5 inch screen, raspberry pi, and portable usb power supply. Once the parts are printed, they fit together and can be assembled like a large lego set. To make the product permanent, an adhesive such as hot glue can be used to fix the parts together, while small screws are recommended for mounting the electronics.

##Hardware:
Most hardware was chosen for its widespread off-the-shelf availability, relative low cost, and available parts we had lying around. Here is the exact list:  
[Anker Ultra Compact 10000mAh Portable External   Battery](http://www.amazon.com/Anker-10000mAh-Portable-External-Technology/dp/B009USAJCC/ref=sr_1_4?s=wireless&ie=UTF8&qid=1438061320&sr=1-4)  
[SparkFun FM Tuner Evaluation Board - Si4703](https://www.sparkfun.com/products/10663)  
[2x Thin Speaker](https://www.sparkfun.com/products/10722)  
[NeoPixel Ring - 16 x WS2812 5050 RGB LED](https://www.sparkfun.com/products/12664)  
[Edimax EW-7811Un](http://www.amazon.com/Edimax-EW-7811Un-150Mbps-Raspberry-Supports/dp/B003MTTJOY)  
[ADXL335 - 5V ready triple-axis accelerometer](https://www.adafruit.com/products/163)  
[Raspberry PI 2 Model B](https://www.raspberrypi.org/products/raspberry-pi-2-model-b/)  
[PI Camera Module](https://www.raspberrypi.org/products/camera-module/)  
[Arduino Nano](https://www.arduino.cc/en/Main/ArduinoBoardNano)  
[Logic Level Converter - Bi-Directional](https://www.sparkfun.com/products/12009)  
[HDMI 5" 800x480 Display Backpack - With Touchscreen](http://www.adafruit.com/product/2260)  
The hardware will need self-prepared, low-profile usb and hdmi connectors, as well as 3.5mm jacks. Detailed guides exist on splicing the necessary cables:  
[USB example](https://www.raspberrypi.org/forums/viewtopic.php?f=40&t=32336)  
[3.5mm jack/general wiring exmaple](http://www.hometheatershack.com/forums/remotes-cables-accessories-tweaks/13000-how-solder-illustrated-diy-guide-making-your-own-cables.html)  
Protoboards are recommended. A detailed wiring diagram can be found in the Production_Menu_System/ARDUINO/ directory.

##Software:
The software consists of two parts. The first is a Processing sketch found in `Production_Menu_System/Pip-Boy_4000/Driver` which is a fallout inspired GUI with a multi-tab structure based on the games. The second is the Arduino code found in the `Production_Menu_System/ARDUINO/` directory which handles all hardware interaction. 

##OS:
The environment of the PI is a linux based environment, and so several additional steps for the project to work must be taken. The default bundled java in a plain Processing distributable is not compiled for an ARM device like the PI, so the bundled java needs to be substituted with an ARM-compatible java. To ensure correct functioning of the PIP-Boy 4000 system from bootup, the `/etc/rc.local` script needs the processing command-line invocation to be added to it. Support for Raspberry PI devices also needs to be configured. The camera module can be set up using the `raspi-config` script provided as part of the Raspbian OS. The wifi dongle should be configured like it would on any other linux system. To correct screen orientation, an xorg.conf file must be creted using 
`sudo X -configure`, then the `Option "Rotate" "inverted"` option should be added to the Monitor section of xorg.conf

##License
The included software and data are released under the Beerware license.


