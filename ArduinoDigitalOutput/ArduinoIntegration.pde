import processing.core.PApplet;
import processing.serial.*;
import cc.arduino.*;

public class ArduinoIntegration implements IArduinoIntegration {

  // Change this so that it matches the usb device connected to the Arduino
  String arduinoUSBDeviceName = "/dev/tty.usbmodem1421";

  Arduino arduino;
  
  ArduinoIntegration(PApplet applet) {
      try {
        arduino = new Arduino(applet, arduinoUSBDeviceName , 57600);
      }
      catch(Exception e) {
        println(e.getMessage());
      }
  }
  public void setupDigitalPinAsOutput(int pinNumber) {
    if (arduino != null) {
      arduino.pinMode(pinNumber, Arduino.OUTPUT);
    }
  }

  public void setState(int pinNumber, int state) {
    if (arduino == null)
      return;
    
    arduino.digitalWrite(pinNumber,state);
  }
}