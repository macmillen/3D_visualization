public final Preset P1 = new Preset(106.62995, 29.7626, 261.03033, 217.44147, 269.64914, 249.66037, 229.75172, false, true, false, false, 1, 1, new PVector(-2.1000001, 0.0, -1330.0), new PVector(0.12999997, 0.55999976, 0.0));

class Preset {


  float cv0, cv1, cv2, cv3, cv4, cv5, cv6;
  boolean reA, cuA, liA, spA;
  int mo;
  int sh;
  PVector ca, caR;

  public Preset() {
  }
  public Preset(float cv0, float cv1, float cv2, float cv3, float cv4, float cv5, float cv6, boolean reA, boolean cuA, boolean liA, boolean spA, int mo, int sh, PVector ca, PVector caR) {
    this.cv0 = cv0;
    this.cv1 = cv1;
    this.cv2 = cv2;
    this.cv3 = cv3;
    this.cv4 = cv4;
    this.cv5 = cv5;
    this.cv6 = cv6;
    this.reA = reA;
    this.cuA = cuA;
    this.liA = liA;
    this.spA = spA;
    this.mo = mo;
    this.sh = sh;
    this.ca = ca;
    this.caR = caR;
  }
  void set(Preset preset) {
    scrollbars.scrollbars.get(0).setPos(preset.cv0);
    scrollbars.scrollbars.get(1).setPos(preset.cv1);
    scrollbars.scrollbars.get(2).setPos(preset.cv2);
    scrollbars.scrollbars.get(3).setPos(preset.cv3);
    scrollbars.scrollbars.get(4).setPos(preset.cv4);
    scrollbars.scrollbars.get(5).setPos(preset.cv5);
    scrollbars.scrollbars.get(6).setPos(preset.cv6);
    rectsActive = preset.reA;
    cubesActive = preset.cuA;
    linesActive = preset.liA;
    spheresActive = preset.spA;
    mode = preset.mo;
    shape = preset.sh;
    cam = preset.ca;
    camR = preset.caR;
  }
  void printPreset() {
    println(
      " = new Preset(" +
      scrollbars.scrollbars.get(0).getPos() + "," + scrollbars.scrollbars.get(1).getPos() + "," + scrollbars.scrollbars.get(2).getPos() + "," + 
      scrollbars.scrollbars.get(3).getPos() + "," + scrollbars.scrollbars.get(4).getPos() + "," + scrollbars.scrollbars.get(5).getPos() + "," +
      scrollbars.scrollbars.get(6).getPos() + "," + 
      rectsActive + "," + cubesActive + "," + linesActive + "," + spheresActive + "," +
      mode + "," + shape + "," + 
      "new PVector(" + cam.x + "," + cam.y + "," + cam.z + ")" + "," +
      "new PVector(" + camR.x + "," + camR.y + "," + camR.z + ")" +
      ");"
      );
  }
}