import 'dart:html' as html;
import 'package:stagexl_commons/stagexl_commons.dart';
import 'package:stagexl/stagexl.dart';

Stage stage;
Sprite _container;
PaperToast _toast;


void main() {
  stage = new Stage(html.querySelector('#stage'), webGL: false, color: 0xFFf9f9f9);
  stage.scaleMode = StageScaleMode.NO_SCALE;
  stage.align = StageAlign.TOP_LEFT;
  ContextTool.WEBGL = stage.renderEngine == RenderEngine.WebGL ? true : false;
  new RenderLoop()..addStage(stage);

  FontTool.addFont("Roboto");
  FontTool.loadFonts(start);
}
void start() {
  
  /* Vertical Container */
  VBox vbox = new VBox(10);
  vbox.x = 10;
  vbox.y = 10;
  
  /* 
   * Radio Button Group
   */
  RadioGroupV radioGroupV = new RadioGroupV(5);
  radioGroupV.addChild(new PaperRadioButton(label : "Red pill", activeColor : PaperColor.RED));
  radioGroupV.addChild(new PaperRadioButton(label : "or"));
  radioGroupV.addChild(new PaperRadioButton(label : "Blue pill?", activeColor : PaperColor.BLUE));
  radioGroupV.addEventListener(RadioGroupEvent.BUTTON_SELECTED, _onSelected);
  vbox.addChild(radioGroupV);
  
  PaperCheckbox check1 = new PaperCheckbox(label : "Checkbox with blue label", activeColor: PaperColor.BLUE);
  vbox.addChild(check1);

  PaperCheckbox check2 = new PaperCheckbox(label : "Checkbox with green label and ripple", rippleColor : PaperColor.GREEN);
  vbox.addChild(check2);

  PaperToggleButton toggle1 = new PaperToggleButton(label : "Wi-Fi");
  vbox.addChild(toggle1);

  PaperToggleButton toggle2 = new PaperToggleButton(label : "Bluetooth", activeColor : PaperColor.BLUE, rippleColor : PaperColor.BLUE);
  vbox.addChild(toggle2);
  
  stage.addChild(vbox);
  vbox.setSize(320, 400);
  

}

void _onSelected(RadioGroupEvent event) {
switch(event.index){
  case 0:
    new PaperToast("You chose the Red pill.", stage, fontColor: PaperColor.WHITE, bgColor : PaperColor.RED);
  break;
  case 2:
    new PaperToast("You chose the Blue pill.", stage, fontColor: PaperColor.WHITE, bgColor : PaperColor.BLUE, position: PaperToast.BR);
  break;
  }
}
