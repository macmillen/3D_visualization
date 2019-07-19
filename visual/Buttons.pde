class Buttons {

  Button btnLines;
  Button btnCubes;
  Button btnSpheres;
  Button btnRects;
  Button btnShapeCube;
  Button btnShapePlane;
  Button btnShapeMandala;
  Button btnShapeDodekaeder;
  Button btnMode1;
  Button btnMode2;
  Button btnAutoCam;
  Button btnPlus;
  Button btnMinus;
  Button btnStopMandala;
  Button btnTimeActiveMandala;
  Button btnMandalaColorful;
  Button btnMandelbrot;
  Button btnUp;
  Button btnDown;

  Buttons() {
    btnLines = new Button(width - 50 - 20, 10, 60, 60, PINK, WHITE, true, 0, "/", 30, 0);
    btnCubes = new Button(width - 50 - 20, 10 * 3 + 50 * 1, 60, 60, BLUE, WHITE, true, 0, "■", 30, -3);
    btnSpheres = new Button(width - 50 * 2 - 20 * 2, 10, 60, 60, RED, WHITE, true, 0, "●", 30, 0);
    btnRects = new Button(width - 50 * 2 - 20 * 2, 10 * 3 + 50 * 1, 60, 60, GREEN, WHITE, true, 0, "R", 30, 0);

    btnMode1 = new Button(width / 2 + 50 + 30 * 1 + 5 * 1, 10, 30, 50, BLACK, WHITE, true, 255, "I", 30, 0);
    btnMode2 = new Button(width / 2 + 50 + 30 * 2 + 5 * 2, 10, 30, 50, BLACK, WHITE, true, 255, "II", 30, 0);

    btnAutoCam = new Button(width / 2 - 40 + 30 * 1 + 5 * 1, 10, 50, 50, RED, WHITE, true, 0, "CAM", 15, -5);

    btnShapePlane = new Button(width - BUTTON_WIDTH_SHAPE - 10, 10 * 3 + 50 * 3, BUTTON_WIDTH_SHAPE, 20, RED, WHITE, true, 0, "PLANE", 15, -5);
    btnShapeCube = new Button(width - BUTTON_WIDTH_SHAPE - 10, 10 * 3 + 50 * 3 + 20 + 5, BUTTON_WIDTH_SHAPE, 20, BLUE, WHITE, true, 0, "CUBE", 15, -5);
    btnShapeMandala = new Button(width - BUTTON_WIDTH_SHAPE - 10, 10 * 3 + 50 * 3 + 20 * 2 + 5 * 2, BUTTON_WIDTH_SHAPE, 20, GREEN, WHITE, true, 0, "MANDALA", 15, -5);
    btnShapeDodekaeder = new Button(width - BUTTON_WIDTH_SHAPE - 10, 10 * 3 + 50 * 3 + 20 * 3 + 5 * 3, BUTTON_WIDTH_SHAPE, 20, YELLOW, WHITE, true, 0, "DODEKAEDER", 15, -5);

    btnPlus = new Button(width - 35 * 2 - 10 * 2, height - 35 - 10, 35, 35, RED, WHITE, true, 0, "+", 30, 0);
    btnMinus = new Button(width - 35 - 10, height - 35 - 10, 35, 35, RED, WHITE, true, 0, "-", 30, -3);
    btnStopMandala = new Button(width - 155 - 10, height - 35 - 10, 35, 35, RED, WHITE, true, 0, "S", 30, 0);
    btnTimeActiveMandala = new Button(width - 155 - 10 * 2 - 35, height - 35 - 10, 35, 35, RED, WHITE, true, 0, "T", 30, 0);
    btnMandalaColorful = new Button(width - 155 - 10 * 3 - 35 * 2, height - 35 - 10, 35, 35, RED, WHITE, true, 0, "C", 30, 0);
    btnMandelbrot = new Button(width - 155 - 10 * 4 - 35 * 3, height - 35 - 10, 35, 35, RED, WHITE, true, 0, "M", 30, 0);

    btnUp = new Button(width - 50 - 10, 10 * 6 + 50 * 6 + 20 + 5, 50, 50, BLACK, WHITE, true, 0, "UP", 15, -5);
    btnDown = new Button(width - 50 - 10, 10 * 7 + 50 * 7 + 20 + 5, 50, 50, BLACK, WHITE, true, 0, "DOWN", 15, -5);
  }

  void draw() {
    btnAutoCam.draw();
    btnLines.draw();
    btnCubes.draw();
    btnSpheres.draw();
    btnRects.draw();
    btnMode1.draw();
    btnMode2.draw();
    btnShapeCube.draw();
    btnShapePlane.draw();
    btnShapeMandala.draw();
    btnShapeDodekaeder.draw();
    btnUp.draw();
    btnDown.draw();
    if (shape == SHAPE_MANDALA) {
      btnPlus.draw();
      btnMinus.draw();
      btnStopMandala.draw();
      btnTimeActiveMandala.draw();
      btnMandalaColorful.draw();
      btnMandelbrot.draw();
    }
  }
  void mousePress() {
    if (btnLines.rectOver) linesActive = !linesActive;
    if (btnCubes.rectOver) cubesActive = !cubesActive;
    if (btnSpheres.rectOver) spheresActive = !spheresActive;
    if (btnPlus.rectOver) {
      if (!mandala.mandelbrot)
        mandala.recalcMandalaNet(1);  
      else { 
        if (mandala.timesTable < mandala.mandelbrote.length - 1)
          mandala.timesTable++;
      }
    }
    if (btnMinus.rectOver) {
      if (!mandala.mandelbrot)
        mandala.recalcMandalaNet(-1);  
      else { 
        if (mandala.timesTable > 0)
          mandala.timesTable--;
      }
    }
    if (btnRects.rectOver) rectsActive = !rectsActive;
    if (btnMode1.rectOver) mode = MODE_1;
    if (btnMode2.rectOver) { 
      mode = MODE_2;
      plane.resetPos();
      cube.p.resetPos();
    }
    if (btnShapeCube.rectOver) shape = SHAPE_CUBE;
    if (btnShapePlane.rectOver) shape = SHAPE_PLANE;
    if (btnShapeMandala.rectOver) shape = SHAPE_MANDALA;
    if (btnShapeDodekaeder.rectOver) { 
      shape = SHAPE_DODEKAEDER;
      rectsActive = true;
    }
    if (btnStopMandala.rectOver) mandala.stopMandala = !mandala.stopMandala;
    if (btnTimeActiveMandala.rectOver) mandala.timeActive = !mandala.timeActive;
    if (btnMandalaColorful.rectOver) mandala.colorful = !mandala.colorful;
    if (btnMandelbrot.rectOver) { 
      mandala.mandelbrot = !mandala.mandelbrot;
      if (!mandala.mandelbrot) mandala.nodes = (int)random(0,50);
      else mandala.nodes = 200;
      mandala.recalcMandalaNet(0);
    }
    if (btnAutoCam.rectOver) autoCam = !autoCam;
  }
}