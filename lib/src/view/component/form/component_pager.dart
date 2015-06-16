part of stagexl_commons;



/**
	 * @author nilsdoehring
	 */
class ComponentPager extends ComponentWithDataProxy {

  Sprite holder;

  List chunksPlaced = [];
  int chunkSize = 8;

  int hasPrev = 0;
  bool hasNext = false;
  bool loaded = false;

  Button btnPrev;
  Button btnNext;
  bool pressedNext = false;

  bool disableClick = false;

  int _listItemWidth = 0;
  int get listItemWidth => _listItemWidth;
  void set listItemWidth(int listItemWidth) {
    _listItemWidth = listItemWidth;
  }

  int _listItemHeight = 0;
  int get listItemHeight => _listItemHeight;
  void set listItemHeight(int listItemHeight) {
    _listItemHeight = listItemHeight;
  }

  int _listItemSpacer = 0;
  int get listItemSpacer => _listItemSpacer;
  void set listItemSpacer(int listItemSpacer) {
    _listItemSpacer = listItemSpacer;
  }


  int _rows = 1;
  int get rows => _rows;
  void set rows(int rows) {
    if (rows == 0) rows++;
    _rows = rows;
  }
  ComponentPager() : super() {

    disableClick = false;

    holder = new SpriteComponent();
    addChild(holder);
  }

  @override void redraw() {
    super.redraw();


    _updateControls();
  }

  void setData(List data) {

    disableClick = false;
    this.data = data;
  }

  void setFilterVOAndLoad(IXLVO vo) {
    _proxy.dataRetrieveCommandVO = vo;
    resetAndLoad();
  }
  void resetAndLoad() {
    loaded = false;
    chunksPlaced = [];
    _proxy.reset();
    _proxy.requestChunk(setData, _getChunkIndex(chunksPlaced), chunkSize);
  }
  void onClickNext() {
    if (!hasNext) {
      return;
    }

    disableClick = true;
    pressedNext = true;
//			uiService.lock();

    btnPrev.enabled = false;
    btnNext.enabled = false;

    _proxy.requestChunk(setData, _getChunkIndex(chunksPlaced), chunkSize);
  }
  void onClickPrev() {
    if (hasPrev < 1) {
      return;
    }

    disableClick = true;
    pressedNext = false;
//			uiService.lock();

    //yes, 2times
    chunksPlaced.removeLast();
    chunksPlaced.removeLast();

    btnPrev.enabled = true;
    btnNext.enabled = true;
    _proxy.requestChunk(setData, _getChunkIndex(chunksPlaced), chunkSize);
  }
  void _updateControls() {
    //clone chunk count list
    List<int> chunks = [];
    chunksPlaced.forEach((int c) => chunks.add(c));

    if (chunks.length == 0) {
      return;
    }

    //yes, calling pop twice is correct

    int checkNum = chunks.removeLast();
    if (chunks.length > 1) {
      checkNum = chunks.removeLast();
    }
    hasPrev = 0;

    if (chunks.length > 0) {
      hasPrev = _proxy.hasChunk(_getChunkIndex(chunks), chunkSize);
    }
    hasNext = _proxy.hasChunk(_getChunkIndex(chunksPlaced), chunkSize) > 0;

    if (hasPrev > 0) {
      btnPrev.enabled = true;
    } else {
      btnPrev.enabled = false;
    }
    if (hasNext) {
      btnNext.enabled = true;
    } else {
      btnNext.enabled = false;
    }

//			uiService.unlock();
  }
  int _getChunkIndex(List chunks) {
    int idx = 0;
    for (int num in chunks) {
      idx += num;
    }
    return idx;
  }
}
