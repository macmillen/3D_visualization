class Dodekaeder {
  float[][] dodekaeder;
  color[] col;

  public Dodekaeder() {
    dodekaeder = dodekaeder();

    col = new color[13];

    for (int i = 0; i < col.length; i++)
      col[i] = randomColor();
    //      col[count] = color(255,0,0);
  }


  void draw() {
    pushMatrix();
    translate(width / 2, height / 2, 0);

    /*
    if (linesActive)
     for (int a = 1; a < dodekaeder.length; a++)
     for (int i = 1; i < dodekaeder.length; i++)
     line(dodekaeder[i][1], dodekaeder[i][2], dodekaeder[i][3], dodekaeder[a][1], dodekaeder[a][2], dodekaeder[a][3]);
     */
    strokeWeight(scrollbars.getScrollbars().get(1).getCurrentVal());
    if (linesActive) stroke(WHITE);
    else noStroke();
    fill(255);

    if (rectsActive) {
      dodekaederPart(dodekaeder, col[0], 3, 7, 4, 2, 1);
      dodekaederPart(dodekaeder, col[1], 2, 4, 9, 10, 5);
      dodekaederPart(dodekaeder, col[2], 1, 2, 5, 8, 6);
      dodekaederPart(dodekaeder, col[3], 5, 8, 14, 17, 10);
      dodekaederPart(dodekaeder, col[4], 4, 7, 13, 16, 9);
      dodekaederPart(dodekaeder, col[5], 2, 5, 8, 6, 1);
      dodekaederPart(dodekaeder, col[6], 19, 18, 14, 17, 20);
      dodekaederPart(dodekaeder, col[7], 13, 15, 19, 20, 16);
      dodekaederPart(dodekaeder, col[8], 3, 7, 13, 15, 12);
      dodekaederPart(dodekaeder, col[9], 9, 10, 17, 20, 16);
      dodekaederPart(dodekaeder, col[10], 6, 8, 14, 18, 11);
      dodekaederPart(dodekaeder, col[11], 11, 12, 15, 19, 18);
      dodekaederPart(dodekaeder, col[12], 1, 3, 12, 11, 6);
    }
    if (spheresActive) {
      for (int i = 0; i < dodekaeder.length; i++) {
        pushMatrix(); 
        fill(WHITE);
        translate(dodekaeder[i][1], dodekaeder[i][2], dodekaeder[i][3]);
        sphere(10); 
        popMatrix();
      }
    }
    popMatrix();
  }

  void dodekaederPart(float[][] dodekaeder, color col, int... k) {
    fill(col, 100);
    beginShape();
    vertex(dodekaeder[k[0]][1], dodekaeder[k[0]][2], dodekaeder[k[0]][3]);
    vertex(dodekaeder[k[1]][1], dodekaeder[k[1]][2], dodekaeder[k[1]][3]);
    vertex(dodekaeder[k[2]][1], dodekaeder[k[2]][2], dodekaeder[k[2]][3]);
    vertex(dodekaeder[k[3]][1], dodekaeder[k[3]][2], dodekaeder[k[3]][3]);
    vertex(dodekaeder[k[4]][1], dodekaeder[k[4]][2], dodekaeder[k[4]][3]);
    endShape();
  }

  float[][] dodekaeder() {

    // 20 Eckpunkte 1-20
    // mit je 3 Koordinaten 1,2,3
    float p[][] = new float[21][4];

    int x=1, y=2, z=3;

    // Halbe Seitenlänge des eingeschriebenen Würfels
    float s = 220;

    // Höhe einer Dodekaeder-Kante über dem Würfel
    float h = s*0.5*(float)(Math.sqrt(5)-1);

    // 20 Eckpunkte im lokalen Dodekaeder-Koordinatensystem
    // Nullpunkt = Mittelpunkt
    p[1][x] =    0;        
    p[1][y] =   -h;        
    p[1][z] = -(s+h);
    p[2][x] =    0;        
    p[2][y] =    h;        
    p[2][z] = -(s+h);
    p[3][x] =    s;        
    p[3][y] =   -s;        
    p[3][z] =  -s;
    p[4][x] =    s;        
    p[4][y] =    s;        
    p[4][z] =  -s;
    p[5][x] =   -s;        
    p[5][y] =    s;        
    p[5][z] =  -s;
    p[6][x] =   -s;        
    p[6][y] =   -s;        
    p[6][z] =  -s;
    p[7][x] =    s+h;      
    p[7][y] =    0;        
    p[7][z] =  -h;
    p[8][x] =  -(s+h);     
    p[8][y] =    0;        
    p[8][z] =  -h;
    p[9][x] =    h;        
    p[9][y] =    h+s;      
    p[9][z] =   0;
    p[10][x] =  -h;        
    p[10][y] =   h+s;      
    p[10][z] =  0;
    p[11][x] =  -h;        
    p[11][y] = -(s+h);     
    p[11][z] =  0;
    p[12][x] =   h;        
    p[12][y] = -(s+h);     
    p[12][z] =  0;
    p[13][x] =   s+h;      
    p[13][y] =   0;        
    p[13][z] =  h;
    p[14][x] = -(s+h);     
    p[14][y] =   0;        
    p[14][z] =  h;
    p[15][x] =   s;        
    p[15][y] =  -s;        
    p[15][z] =  s;
    p[16][x] =   s;        
    p[16][y] =   s;        
    p[16][z] =  s;
    p[17][x] =  -s;        
    p[17][y] =   s;        
    p[17][z] =  s;
    p[18][x] =  -s;        
    p[18][y] =  -s;        
    p[18][z] =  s;
    p[19][x] =   0;        
    p[19][y] =  -h;        
    p[19][z] =  s+h;
    p[20][x] =   0;        
    p[20][y] =   h;        
    p[20][z] =  s+h;

    return p;
  }
}