class Digital_GPIO_Pin {
  String name;
  int pinNumber;
  int state;
  GImageToggleButton button;
  GLabel label;
  Digital_GPIO_Pin(String pinName, int pinNum, int initialState) {
    name = pinName;
    pinNumber = pinNum;
    state = initialState;
  }
  
  String getStateAsText() {
    if (state == 0)
      return "off";
    else if (state == 1)
      return "on";
    else
      return "";
  }  
}