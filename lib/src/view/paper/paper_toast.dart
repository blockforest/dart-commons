part of stagexl_commons;

class PaperToast extends SpriteComponent {
  
  static const int BL = 1;
  static const int BR = 2;

  PaperText _title;
  PaperProgress _progress;
  int delay;
  int position;
  Stage holder;

  PaperToast(String title, this.holder, {this.position : BL, int bgColor: PaperColor.WHITE, 
             int fontColor : PaperColor.BLACK,  String fontName : PaperText.DEFAULT_FONT,
             this.delay : 3}) : super() {
    
    addChild( new PaperShadow(type : PaperShadow.RECTANGLE, bgColor: bgColor, respondToClick: false) );

    _title = new PaperText(title, size: 18, color: fontColor, fontName: fontName);
    addChild(_title);
    
    _progress = new PaperProgress(0, 100, 300, bgColor: bgColor, barColor : fontColor);
    addChild(_progress);
    _progress.value = 0;
     
    
    
    holder.addChild(this);
    setSize(300, 50);
    
    stage.juggler.tween(this, .3, TransitionFunction.easeOutBounce)
      ..animate.y.to(stage.stageHeight - this.height - 20);

    stage.juggler.tween(this, .3, TransitionFunction.easeOutBounce)
      ..animate.y.to(stage.stageHeight)
      ..delay = delay
      ..onComplete = () => this.destroy();

    stage.juggler.transition(0, 100, delay, TransitionFunction.linear, (num val) => _progress.value= val );
  }

  @override void redraw() {
    super.redraw();
    
    _title.x = 20;
    _title.y = (heightAsSet/2 - _title.textHeight/2).round();
    _title.width = widthAsSet - 40;
    
    _progress.y = heightAsSet - _progress.height;
    
    switch(position){
      case BL:
        x = 20;
        y = holder.stageHeight;
        break;
      case BR:
        x = holder.stageWidth - widthAsSet - 20;
        y = holder.stageHeight;
        break;
    }
  }
}
