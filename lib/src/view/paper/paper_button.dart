part of stagexl_commons;


class PaperButton extends Button {
  static const int SPACER = 10;

  static const int PRESET_WHITE = 1;
  static const int PRESET_GREY = 2;
  static const int PRESET_BLUE = 3;
  static const int PRESET_GREEN = 4;
  static const int PRESET_RED = 5;

  static const int LABEL_MAX_WIDTH = 400;

  PaperText _label;
  int _bgColor;

  PaperButton(String text, {num width: 120, num height: 32, 
                            int bgColor: -1, int fontColor : -1, String fontName: PaperText.DEFAULT_FONT, int fontSize: 14,
                            int preset: PRESET_WHITE,
                            bool shadow : true, bool background : true}) : super() {
    int _fontAndRippleColor;
    switch (preset) {
      case PRESET_WHITE:
        _bgColor = PaperColor.WHITE;
        _fontAndRippleColor = 0xFF646464;
        break;
      case PRESET_GREY:
        _bgColor = PaperColor.GREY;
        _fontAndRippleColor = 0xFF646464;
        break;
      case PRESET_BLUE:
        _bgColor = PaperColor.BLUE;
        _fontAndRippleColor = 0xFFFFFFFF;
        break;
      case PRESET_GREEN:
        _bgColor = PaperColor.GREEN;
        _fontAndRippleColor = 0xFFFFFFFF;
        break;
      case PRESET_RED:
        _bgColor = PaperColor.RED;
        _fontAndRippleColor = 0xFFFFFFFF;
        break;
    }
    
    if(bgColor != -1){
      _bgColor = bgColor;
    }

    if(fontColor != -1){
      _fontAndRippleColor = fontColor;
    }

    if(background){
      PaperShadow paperShadow = new PaperShadow(type : PaperShadow.RECTANGLE, bgColor: _bgColor, shadowEnabled : shadow);
      addChild(paperShadow);
    }
    
    PaperRipple paperRipple = new PaperRipple(color: _fontAndRippleColor);
    addChild(paperRipple);

    _label = new PaperText(text, size: fontSize, color: _fontAndRippleColor, fontName: fontName);
    _label.width = LABEL_MAX_WIDTH;
    addChild(_label);


    setSize(width, height);
    //enabled = true;
  }


  @override void redraw() {

    if (widthAsSet > 0) {
      _label.x = (widthAsSet / 2 - _label.textWidth / 2).round() - 3;
    } else {
      widthAsSet = _label.textWidth + 4 * SPACER;
      _label.x = (widthAsSet / 2 - _label.textWidth / 2).round() - 3;
    }

    _label.width = widthAsSet - SPACER;
    _label.y = (heightAsSet / 2 - _label.textHeight / 2).round();

    super.redraw();
  }

  @override void setLabel(String label) {
    super.setLabel(label);
    _label.text = label;
    redraw();
  }

}
