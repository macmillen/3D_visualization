public static final int DIST_Y_MAX = 100;
public static final int RECT_SIZE_X = 150;
public static final int RECT_SIZE_Y = 150;
public static final int RECT_SIZE_Z = 150;
public static final int MOV_TIME_MIN = 50;
public static final int MOV_TIME_MAX = 700;
public static final int LINE_WEIGHT_MAX = 5;

class Scrollbars {

  ArrayList<HScrollbar> scrollbars;

  public Scrollbars() {
    scrollbars = new ArrayList<HScrollbar>();

    scrollbars.add(new HScrollbar(0, 0.3, DIST_Y_MAX, "DIST_Y"));
    scrollbars.add(new HScrollbar(1, 0.5, LINE_WEIGHT_MAX, "LINE_WEIGHT"));
    scrollbars.add(new HScrollbar(2, 0.9, MOV_TIME_MIN, "TIME_MIN", MODE_1));
    scrollbars.add(new HScrollbar(3, 0.8, MOV_TIME_MAX, "TIME_MAX", MODE_1));
    scrollbars.add(new HScrollbar(2, 0.3, RECT_SIZE_X, "RECT_X", MODE_2));
    scrollbars.add(new HScrollbar(3, 0.3, RECT_SIZE_Y, "RECT_Y", MODE_2));
    scrollbars.add(new HScrollbar(4, 0.0, RECT_SIZE_Z, "RECT_Z", MODE_2));
  }

  void draw() {
    for (int i = 0; i < scrollbars.size(); i++) {
      scrollbars.get(i).draw();
    }
  }

  public ArrayList<HScrollbar> getScrollbars() {
    return scrollbars;
  }
}