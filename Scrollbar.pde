class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;
  int[] modes;
  int maximum;
  String text;
  int order;

  HScrollbar (int order, float startPos, int maximum, String text, int... modes) {
    swidth = 300 - (int)order * 20;
    sheight = 16;
    int widthtoheight = swidth - sheight;
    ratio = (float)swidth / (float)widthtoheight;
    xpos = 10;
    this.ypos = 18 + order * 30 - sheight / 2;
    spos = xpos + startPos * swidth;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = 16;

    this.modes = modes;
    this.maximum = maximum;
    this.text = text;
    this.order = order;
  }

  void draw() {
    for (int i = 0; i < modes.length; i++) {
      if (mode == modes[i]) {
        update();
        display();
        break;
      }
    }
    if (modes.length == 0) {
      update();
      display();
    }
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos + swidth && mouseY > ypos && mouseY < ypos + sheight)
      return true;
    else
      return false;
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);

    fill(255);
    textSize(17);
    textAlign(LEFT);
    text(text + ": " + round(getCurrentVal()), swidth + 20, 24 + 30 * order);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
  void setPos(float ratio) {
    newspos = ratio ;
    println(ratio);
  }

  float getMultiplier() {
    return getPos() / swidth;
  }
  float getCurrentVal() {
    return getMultiplier() * maximum;
  }
}