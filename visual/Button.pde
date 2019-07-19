class Button {
  int rectX, rectY;     
  int triX, triY;       
  final int rectSizeX, rectSizeY;   
  boolean rectOver = false;  
  color col, col2;
  boolean stroke;
  int opacity;
  String text = "";
  int fontSize;
  float txtOffsetY;

  Button(int rectX, int rectY, int rectSizeX, int rectSizeY, color col, color col2, boolean stroke, int opacity) {
    this.rectX = rectX;
    this.rectY = rectY;
    this.rectSizeX = rectSizeX;
    this.rectSizeY = rectSizeY;
    this.col = col;
    this.col2 = col2;
    this.stroke = stroke;
    this.opacity = opacity;
  }
  Button(int rectX, int rectY, int rectSizeX, int rectSizeY, color col, color col2, boolean stroke, int opacity, String text, int fontSize, float txtOffsetY) {
    this.rectX = rectX;
    this.rectY = rectY;
    this.rectSizeX = rectSizeX;
    this.rectSizeY = rectSizeY;
    this.col = col;
    this.col2 = col2;
    this.stroke = stroke;
    this.opacity = opacity;
    this.text = text;
    this.fontSize = fontSize;
    this.txtOffsetY = txtOffsetY;
  }

  void draw() {

    rectOver = overRect(rectX, rectY, rectSizeX, rectSizeY);

    noStroke();
    strokeWeight(3);
    if (rectOver) {
      if (stroke) stroke(col);
      fill(col2, opacity);
    } else {
      if (stroke) stroke(col2);
      fill(col, opacity);
    }
    strokeWeight(1);
    rect(rectX, rectY, rectSizeX, rectSizeY);

    if (!text.equals("")) {
      if (rectOver) fill(col);
      else fill(col2);
      textAlign(CENTER);
      textSize(fontSize);
      text(text, rectX + rectSizeX / 2, rectY + rectSizeY / 2 + 10 + txtOffsetY);
    }
  }

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
}