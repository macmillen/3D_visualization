class Cube {

  Plane p;

  public Cube() {
    p = new Plane();
  }

  void draw() {
    for (int a = 0; a < p.ROWS; a++)
      for (int i = 0; i < p.COLUMNS; i++) {
        if (a == 0 || a == p.ROWS - 1 || i == 0 || i == p.ROWS - 1) p.positions[a][i].y = 0;
      }

    // BOTTOM
    p.draw(true);

    // TOP
    pushMatrix();
    translate(p.DIST * (p.ROWS - 1), p.DIST * (p.ROWS - 1));
    rotateZ(-PI);
    p.draw(false);
    popMatrix();

    // FRONT
    pushMatrix();
    rotateX(-PI / 2);
    p.draw(false);
    popMatrix();

    // BACK
    pushMatrix();
    translate(0, 0, p.DIST * (p.ROWS - 1));
    rotateX(-PI / 2);
    p.draw(false);
    popMatrix();

    // LEFT
    pushMatrix();
    translate(0, p.DIST * (p.ROWS - 1));
    rotateZ(-PI / 2);
    p.draw(false);
    popMatrix();

    // RIGHT
    pushMatrix();
    translate(p.DIST * (p.ROWS - 1), 0);
    rotateZ(PI / 2);
    p.draw(false);
    popMatrix();

  }

  void mode2Buttons() {
    p.mode2Buttons();
  }
}