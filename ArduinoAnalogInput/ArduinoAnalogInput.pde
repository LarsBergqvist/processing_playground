
int maxBarHeight = 300;
int barWidth = 200;

// A list with bars to draw
// Specify the matching Arduino analog pin number and a color
BarSpec[] barSpecs = { new BarSpec(1, color(100,50,50)), new BarSpec(2, color(50,100,50)), new BarSpec(2, color(50,50,100)) };

//IArduinoIntegration arduino = new ArduinoFakeIntegration();
IArduinoIntegration arduino = new ArduinoIntegration();

void setup() {
  size(600,400);
  background(100,100,100);
  for (BarSpec barSpec : barSpecs) {
    arduino.setupAnalogPinAsInput(barSpec.pinNumber);  
  }  
}

void draw() {
  background(0);
  
  int numPinsDrawn = 0;
  for (BarSpec barSpec : barSpecs) {
    float v = arduino.getVoltageFromPin(barSpec.pinNumber);
    
    // Draw the bar
    int barXPos = barWidth*numPinsDrawn;
    float barHeight = map(v,0,5.0,0,maxBarHeight);
    fill(barSpec.barColor);
    rect(barXPos,height-barHeight,barWidth,barHeight);
    
    // Draw the text within the bar
    fill(200,200,200);
    textSize(20);
    text(round(v*100)/100.0 + "[V]",barXPos,height-40);
    text("Pin A" + barSpec.pinNumber,barXPos,height-20);
    
    numPinsDrawn++;
  }
  
  delay(500);
}