class Plane {

  PVector[][] positions;
  PVector[][] mov;
  color[][] col;
  Button[][] btns;

  final int ROWS = 10;
  final int COLUMNS = 10;
  final int DIST = 100;

  final float SPEED_M1 = 0.65f;
  final float SPEED_M2 = 6.5f;
  final float OSCILLATION = 0.9;

  public Plane() {

    positions = new PVector[ROWS][COLUMNS];
    mov = new PVector[ROWS][COLUMNS];
    col = new color[ROWS][COLUMNS];
    btns = new Button[ROWS][COLUMNS];


    for (int a = 0; a < ROWS; a++)
      for (int i = 0; i < COLUMNS; i++) {
        mov[a][i] = new PVector();
        btns[a][i] = new Button(i * 21 + 10, -a * 21 + height - 30, 20, 20, BLACK, WHITE, true, 0);
        positions[a][i] = new PVector();
        positions[a][i].x = width / 2 - (ROWS - 1.0) / 2 * DIST + i * DIST;
                println(positions[a][i].x);
                println(i);

        positions[a][i].z = a * DIST;
      }
  }

  void draw(boolean wobble) {

    strokeWeight(scrollbarCurrentVals[1]);

    for (int a = 0; a < ROWS; a++)
      for (int i = 0; i < COLUMNS; i++) {
        
        if (wobble) {

          // *** MODE 1 *** //

          if (mode == MODE_1) {
            if (mov[a][i].z + mov[a][i].y < millis()) { 
              col[a][i] = randomColor();
              mov[a][i].x = (int)random(0, 2);
              mov[a][i].y = (int)random(scrollbarCurrentVals[2], scrollbarCurrentVals[3]);
              mov[a][i].z = millis();
            }
            if (mov[a][i].x == 0)
              if (positions[a][i].y + 1 < scrollbarCurrentVals[0]) positions[a][i].y += SPEED_M1;
              else positions[a][i].y -= SPEED_M1;
            else
              if (positions[a][i].y - 1 >= 0) positions[a][i].y -= SPEED_M1;
              else positions[a][i].y += SPEED_M1;
          }

          // *** MODE 2 *** //

          if (mode == MODE_2) {
            stroke(WHITE);
            if (mov[a][i].x > 0) {
              if (mov[a][i].x * scrollbarCurrentVals[0] > positions[a][i].y) {
                positions[a][i].y += SPEED_M2;
              } else {
                mov[a][i].x *= -OSCILLATION;
              }
            } else if (mov[a][i].x < 0) {
              if (mov[a][i].x * scrollbarCurrentVals[0] < positions[a][i].y) {
                positions[a][i].y -= SPEED_M2;
              } else {
                mov[a][i].x *= -OSCILLATION;
              }
            }
            if (Math.abs((mov[a][i].x)) < 0.01 && mov[a][i].x != 0) {
              mov[a][i].x = 0;
              positions[a][i].y = 0;
            }
          }
        }

        // ooo SPHERES ooo //

        if (spheresActive) {
          noStroke();
          fill(WHITE);
          sphereDetail(8);
          drawSpheres(a, i, 10);
        }

        // ### RECTS ### //

        if (rectsActive) {
          if (i < COLUMNS - 1 && a < ROWS - 1) {
            fill(col[a][i], 100);
            noStroke();
            drawPlaneRects(a, i);
          }
        }

        // --- LINES --- //

        if (linesActive) {
          if (mode == MODE_1) stroke(col[a][i]);
          if (mode == MODE_2) stroke(WHITE);

          if (i < COLUMNS - 1)
            line(positions[a][i].x, positions[a][i].y, positions[a][i].z, positions[a][i + 1].x, positions[a][i + 1].y, positions[a][i + 1].z);
          if (a < ROWS - 1)
            line(positions[a][i].x, positions[a][i].y, positions[a][i].z, positions[a + 1][i].x, positions[a + 1][i].y, positions[a + 1][i].z);
        }

        // CCC CUBES CCC //

        if (cubesActive) {
          if (i < COLUMNS - 1 && a < ROWS - 1) {
            stroke(col[a][i]);
            noFill();

            pushMatrix(); 
            translate(positions[a][i].x + (positions[a][i + 1].x - positions[a][i].x) / 2, Math.abs((positions[a + 1][i + 1].y - positions[a][i].y) / 2), positions[a][i].z + (positions[a + 1][i].z - positions[a][i].z) / 2);
            rotateX(0.03 * frameCount);
            box(scrollbarCurrentVals[4], scrollbarCurrentVals[5], scrollbarCurrentVals[6]); 
            popMatrix();
          }
        }
      }
  }

  void mode2Buttons() {
    if (mode == MODE_2)
      for (int a = 0; a < ROWS; a++)
        for (int i = 0; i < COLUMNS; i++) {
          btns[a][i].draw();
          if (btns[a][i].rectOver) {
            positions[a][i].y = -scrollbarCurrentVals[0];
            mov[a][i].x = 1;
          }
        }
  }
  void resetPos() {
    for (int a = 0; a < ROWS; a++)
      for (int i = 0; i < COLUMNS; i++) {
        positions[a][i].y = 0;
        mov[a][i].x = 0;
      }
  }

  void drawSpheres(int a, int i, float size) {
    pushMatrix(); 
    translate(positions[a][i].x, positions[a][i].y, positions[a][i].z);
    sphere(size); 
    popMatrix();
  }

  void drawPlaneRects(int a, int i) {
    beginShape();
    vertex(positions[a][i].x, positions[a][i].y, positions[a][i].z);
    vertex(positions[a + 1][i].x, positions[a + 1][i].y, positions[a + 1][i].z);
    vertex(positions[a + 1][i + 1].x, positions[a + 1][i + 1].y, positions[a + 1][i + 1].z);
    vertex(positions[a][i + 1].x, positions[a][i + 1].y, positions[a][i + 1].z);
    endShape(CLOSE);
  }
  float getWidth(){
    return (ROWS - 1) * DIST;
  }
}