/**
* This Processing sketch reads analog input pins from an Arduino UNO that runs the standard firmata sketch
* The values are drawn as bars on the screen
* Depends on the Processing Arduino Firmata library
* Usage:
* 1) Upload the standard firmata sketch with Arduino IDE to the Arduino UNO
* 2) Close the Arduino IDE and disconnect the USB cable
* 3) Connect the USB cable and check what device name the Arduino USB connection has
* 4) Change the arduinoUSBDeviceName in the ArduinoIntegration class
* 5) Start the sketch
* The GUI in this sketch can be tested without a connected Arduino. In that case, change
* the ArduinoIntegration instansiation to using the ArduinoFakeIntegration. This class generates
* random values 0-5 for the analog pins.
**/

int maxBarHeight = 600;
int barWidth = 400;

// A list with bars to draw
// Specify the matching Arduino analog pin number and a color for the bar that should represent the input voltage
BarSpec[] barSpecs = { new BarSpec(0, color(150,150,20)), new BarSpec(1, color(20,100,20)), new BarSpec(2, color(20,20,100)) };

//IArduinoIntegration integration = new ArduinoFakeIntegration();
IArduinoIntegration integration = new ArduinoIntegration(this);


void setup() {
  size(1200,600);
  for (BarSpec barSpec : barSpecs) {
    integration.setupAnalogPinAsInput(barSpec.pinNumber);  
  }  
}

void draw() {
  background(0);
  
  int numPinsDrawn = 0;
  for (BarSpec barSpec : barSpecs) {
    float v = integration.getVoltageFromPin(barSpec.pinNumber);
    
    // Draw the bar
    int barXPos = barWidth*numPinsDrawn;
    float barHeight = map(v,0,5.0,0,maxBarHeight);
    fill(barSpec.barColor);
    rect(barXPos,height-barHeight,barWidth,barHeight);
    
    // Draw the text within the bar
    fill(200,200,200);
    textSize(40);
    text(round(v*100)/100.0 + "[V]",barXPos,height-80);
    text("Pin A" + barSpec.pinNumber,barXPos,height-40);
    
    numPinsDrawn++;
  }
  
  delay(200);
}
