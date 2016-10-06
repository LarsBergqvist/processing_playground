import g4p_controls.*;

//IArduinoIntegration arduino = new ArduinoFakeIntegration();
IArduinoIntegration arduino = new ArduinoIntegration(this);

Digital_GPIO_Pin[] pins = { new Digital_GPIO_Pin("D7",7,0), 
                            new Digital_GPIO_Pin("D11",11,1), 
                            new Digital_GPIO_Pin("D12",13,0), 
                            new Digital_GPIO_Pin("D14",14,0) 
                          };

public void setup() {  
  size(400, 200);

  int buttonArea = width/pins.length;
  int numDrawnButtons = 0;
  for (Digital_GPIO_Pin pin : pins ) {
    pin.button = new GImageToggleButton(this, numDrawnButtons*buttonArea+10, 10);
    pin.button.setState(pin.state);
    pin.label = new GLabel(this, numDrawnButtons*buttonArea+10, 10 + 40, 50, 50);
    arduino.setupDigitalPinAsOutput(pin.pinNumber);
    arduino.setState(pin.pinNumber,pin.state);
    numDrawnButtons++;
  }  
}

public void draw() {
  background(150, 200, 150);
  for (Digital_GPIO_Pin pin : pins ) {
      pin.label.setText(pin.name + " : " + pin.getStateAsText());     
      arduino.setState(pin.pinNumber,pin.state);
  }
}

// Event handler for image toggle buttons
public void handleToggleButtonEvents(GImageToggleButton button, GEvent event) { 
  for (Digital_GPIO_Pin pin : pins ) {
    if (pin.button == button) {
      pin.state = button.getState();
      break;
    }
  }
}