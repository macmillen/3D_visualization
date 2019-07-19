int count = 0;

Plane plane;
Cube cube;
Dodekaeder dodekaeder;
Mandala mandala;
Buttons buttons;
Scrollbars scrollbars;
static float[] scrollbarCurrentVals;
Preset preset;

PFont fontType;

boolean autoCam = false;

boolean[] keyCodes = {false, false, false, false};
boolean[] keys = {false, false, false, false, false, false};

static int mode = 0;
static int shape = 0;

PVector cam = new PVector();
PVector camR = new PVector();

static boolean linesActive = true;
static boolean cubesActive = false;
static boolean spheresActive = true;
static boolean rectsActive = false;

void setup() {
  fontType = createFont("arial.ttf", 70);
  textFont(fontType);

  size(1300, 800, P3D);
  background(0);

  plane = new Plane();
  cube = new Cube();
  dodekaeder = new Dodekaeder();
  mandala = new Mandala();
  buttons = new Buttons();
  scrollbars = new Scrollbars();
  scrollbarCurrentVals = new float[scrollbars.getScrollbars().size()];
  preset = new Preset();
  //preset.set(P1);
  
  }

void draw() {
  clear();

if(rectsActive) hint(DISABLE_DEPTH_TEST);
else hint(ENABLE_DEPTH_TEST);

  //preset.printPreset();

  for (int i = 0; i < scrollbarCurrentVals.length; i++)
    scrollbarCurrentVals[i] = scrollbars.getScrollbars().get(i).getCurrentVal();

  pushMatrix();
  translate(cam.x, 0,cam.z);

  rotateX(-PI/2+camR.x);
  rotateY(camR.y);
  rotateZ(camR.z);

  if (autoCam) {
    rotateY(frameCount * 0.01);
    rotateZ(frameCount * 0.01);
    rotateX(frameCount * 0.01);
  }

 
  if (shape == SHAPE_PLANE) plane.draw(true);
  if (shape == SHAPE_CUBE) cube.draw();
  if (shape == SHAPE_MANDALA) mandala.draw();
  if (shape == SHAPE_DODEKAEDER) dodekaeder.draw();

  popMatrix();

  /************ GUI ************/
  scrollbars.draw();
  buttons.draw();

  if (shape == SHAPE_PLANE) plane.mode2Buttons();
  if (shape == SHAPE_CUBE) cube.mode2Buttons();
  if (shape == SHAPE_MANDALA) mandala.mode2Buttons();

  camMovement();
}

void camMovement() {
  if (keyPressed) {
    float speedX = 0.1;
    float speedZ = 10;
    float speedR = 0.01;
    if (keyCodes[KEY_UP]) cam.z += speedZ;
    if (keyCodes[KEY_DOWN]) cam.z -= speedZ;
    if (keyCodes[KEY_LEFT]) cam.x += speedX;
    if (keyCodes[KEY_RIGHT]) cam.x -= speedX;
    if (keys[KEY_S]) camR.x -= speedR;
    if (keys[KEY_W]) camR.x += speedR;
    if (keys[KEY_D]) camR.y -= speedR;
    if (keys[KEY_A]) camR.y += speedR;
    if (keys[KEY_E]) camR.z -= speedR;
    if (keys[KEY_Q]) camR.z += speedR;
  }
}

void keyPressed() {
  setMove(key, true);
  setMove(keyCode, true);
}
void keyReleased() {
  setMove(key, false);
  setMove(keyCode, false);
  if (keyCode == TAB) count++;
}

void setMove(int k, boolean b) {
  int[] cases = {UP, DOWN, LEFT, RIGHT};
  for (int i = 0; i < cases.length; i++)
    if (cases[i] == k) keyCodes[i] = b;
}

void setMove(char k, boolean b) {
  k = Character.toUpperCase(k);
  char[] cases = {'A', 'D', 'W', 'S', 'Q', 'E'};
  for (int i = 0; i < cases.length; i++)
    if (cases[i] == k) keys[i] = b;
}

void mousePressed() {
  buttons.mousePress();
}


color randomColor() {
  return color((int)random(0, 256), (int)random(0, 256), (int)random(0, 256));
}