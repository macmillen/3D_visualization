class Mandala {

  final float MANDALA_RADIUS = 500;

  ArrayList<Float> degrees;
  ArrayList<PVector> positions;
  int nodes = 200;
  float time;
  boolean timeActive = true;
  boolean incrNodes;
  boolean stopMandala = false;
  ArrayList<Button> btns;
  boolean colorful = true;
  boolean swap = false;
  int swap2 = 0;
  boolean mandelbrot = true;
  int timesTable = 3;
  int[] mandelbrote = {21, 29, 33, 34, 49, 51, 66, 67, 73, 76, 79, 80, 85, 86, 91, 99};

  public Mandala() {
    degrees = new ArrayList<Float>();
    positions = new ArrayList<PVector>();
    time = millis();
    incrNodes = false;

    btns = new ArrayList<Button>();
    recalcMandalaNet(0);
  }

  void draw() {
    sphereDetail(8);
    if (swap2 == 255 || swap2 == 0) swap = !swap;
    if (swap) swap2 += 5;
    else swap2 -= 5;

    for (int i = 0; i < nodes; i++) {
      pushMatrix();
      translate(positions.get(i).x, positions.get(i).y, positions.get(i).z);
      noStroke();
      if (!colorful) fill(RED);
      if (colorful) fill(swap2, 255 - swap2, 255);
      if (spheresActive) sphere(10);
      popMatrix();
      if (!colorful) stroke(RED);
      if (colorful) stroke(swap2, 255 - swap2, 255);
      strokeWeight(scrollbars.getScrollbars().get(1).getCurrentVal());
      if (!mandelbrot) {
        if (linesActive)
          for (int a = 0; a < nodes; a++) {
            line(positions.get(i).x, positions.get(i).y, positions.get(i).z, positions.get(a).x, positions.get(a).y, positions.get(a).z);
          }
      } else { 
        if (linesActive)
          line(positions.get(i).x, positions.get(i).y, positions.get(i).z, 
            positions.get((i * mandelbrote[timesTable]) % nodes).x, positions.get((i * mandelbrote[timesTable]) % nodes).y, positions.get((i * mandelbrote[timesTable]) % nodes).z);
      }
    }
    if (!mandelbrot) {
      if (timeActive) time = 0;
      if (time + 300 - nodes * 6 < millis()) {
        if (nodes == 0) incrNodes = true;
        if (nodes == 50) incrNodes = false;
        if (!stopMandala) {
          if (incrNodes) recalcMandalaNet(1);
          if (!incrNodes) recalcMandalaNet(-1);
        }
        time = millis();
      }
    } else nodes = 200;
  }

  void mousePress() {
  }

  void mode2Buttons() {
    if (mode == MODE_2)
      for (int i = 0; i < btns.size(); i++) {
        btns.get(i).draw();
        if (btns.get(i).rectOver) {
          positions.get(i).z = -scrollbarCurrentVals[0];
        }
      }
  }

  void recalcMandalaNet(int incr) {
    nodes += incr;
    degrees.clear();
    positions.clear();
    btns.clear();
    for (int i = 0; i < nodes; i++) {
      degrees.add(2 * PI / nodes * i);
      positions.add(new PVector(
        cos(degrees.get(i)) * MANDALA_RADIUS + width / 2, 
        sin(degrees.get(i)) * MANDALA_RADIUS + height / 2));
      btns.add(new Button((int)(positions.get(i).x * 0.1) + 20, height - 30 - 20 - (int)(positions.get(i).y * 0.1), 50, 10, BLACK, WHITE, true, 0));
    }
  }
}