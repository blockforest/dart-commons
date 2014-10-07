part of stagexl_commons;



class Button extends SpriteComponent {
  String _labelText;

  Button() : super() {

    buttonMode = true;
    useHandCursor = true;
    mouseChildren = false;
    enabled = true;
    //ignoreSetEnabled = true;
  }


  @override
  void set enabled(bool value) {
    if (_enabled == value) {
      return;
    }

    super.enabled = value;
    mouseChildren = false;

    if (value == true) {
      addEventListener(MouseEvent.MOUSE_UP, onClick);
      addEventListener(MouseEvent.MOUSE_DOWN, _onMouseDown);
      addEventListener(MouseEvent.ROLL_OVER, onRollOver);
      addEventListener(MouseEvent.ROLL_OUT, onRollOut);
      onRollOut();
    } else {
      removeEventListener(MouseEvent.MOUSE_UP, onClick);
      removeEventListener(MouseEvent.MOUSE_DOWN, _onMouseDown);
      removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
      removeEventListener(MouseEvent.ROLL_OUT, onRollOut);
      onRollOver();
    }
  }
  void setLabel(String label) {
    _labelText = label;
  }
  void _onMouseDown([MouseEvent event = null]) {
    DisplayObject child;
    for (int i = 0; i < numChildren; i++) {
      child = getChildAt(i);
      if (child is IPaperButtonComponent) {
        (child as IPaperButtonComponent).downAction(event);
      }
    }
  }
  void onClick([MouseEvent event = null]) {
    DisplayObject child;
    for (int i = 0; i < numChildren; i++) {
      child = getChildAt(i);
      if (child is IPaperButtonComponent) {
        (child as IPaperButtonComponent).upAction(event);
      }
    }
    if (_submitCallback != null) {
      Function.apply(_submitCallback, _submitCallbackParams);
    }
    if (_submitEvent != null) {
      _submitEvent.dispatch();
    }
  }
  void onRollOver([MouseEvent event = null]) {
    // Override this method
  }
  void onRollOut([MouseEvent event = null]) {
    // Override this method
  }

  void createBG(Shape bg, int color, int w, int h) {
    bg.graphics.clear();
    bg.graphics.rect(0, 0, w, h);
    bg.graphics.fillColor(color);
    if (ContextTool.WEBGL) {
      bg.applyCache(0, 0, w, h);
    }
    if(bg.parent == null){
      addChildAt(bg, 0);
    }
  }
}
