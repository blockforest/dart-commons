part of acanvas_commons;

/**
 * @author Nils Doehring (nilsdoehring@gmail.com)
 */
enum ListDirection { HORIZONTAL, VERTICAL }

abstract class MList {
  bool _horizontalFlow = false;

  ListDirection _listDirection;

  void set listDirection(ListDirection listDirection) {
    _listDirection = listDirection;
    _horizontalFlow = listDirection == ListDirection.HORIZONTAL ? true : false;
  }

  ListDirection get listDirection => _listDirection;

  int _spacing = 0;

  void set spacing(int spacing) {
    _spacing = spacing;
  }

  int get spacing => _spacing;

  IDataProxy _proxy;

  IDataProxy get listProxy => _proxy;

  void set listProxy(IDataProxy m) {
    _proxy = m;
  }

  List<Object> _data = new List<Object>();

  List get data => _data;

  set data(List<Object> data) {
    _data = data;
  }

  int _bufferSize = 20;

  int get bufferSize => _bufferSize;

  void set bufferSize(int bufferSize) {
    _bufferSize = bufferSize;
  }

  bool _constantCellSize = true;

  void set constantCellSize(bool constantCellSize) {
    _constantCellSize = constantCellSize;
  }

  bool get constantCellSize => _constantCellSize;

  bool _selfDeselect = false;

  bool get selfDeselect => _selfDeselect;

  void set selfDeselect(bool selfDeselect) {
    _selfDeselect = selfDeselect;
  }

  bool _multiSelectable = false;

  bool get multiSelectable => _multiSelectable;

  void set multiSelectable(bool multiSelectable) {
    _multiSelectable = multiSelectable;
  }
}
