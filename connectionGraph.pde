class connectionGraph {
  int p1, p2, rad, rotater;
  connection[] allConnections = new connection[0];  
  String[] nums;
  PFont  font;
  float dist;
  ArrayList angles;
  float squareWidth, squareHeight;
  boolean bigFlag;
  color c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9;
  color d0, d1, d2, d3, d4, d5, d6, d7, d8, d9;
  String[] vals = {
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
  };
  boolean draw1 = false;
  boolean draw2 = false;
  boolean draw3 = false;


  connectionGraph(int x, int y, int radius, String[] nums, boolean bigFlag) {
    p1 = x;
    p2 = y;
    rad = radius;
    this.nums = nums;
    font = createFont("Georgia", 15);
    rotater = 0;
    this.bigFlag = bigFlag;
  }

  connection addconnection(String node1, String node2, color colory, float thickness, int rotatery) {
    int index1 = 0;
    int index2 = 0;
    for ( int i=0; i < nums.length; i++ ) {
      if ( nums[i].equals(node1) ) {
        index1 = i;
      }
    }
    for ( int i=0; i < nums.length; i++ ) {
      if ( nums[i].equals(node2) ) {
        index2 = i;
      }
    }
    float angle1 = TWO_PI - TWO_PI * (float)index1 / (float)nums.length;
    float angle2 = TWO_PI - TWO_PI * (float)index2 / (float)nums.length;

    connection singleCon = new connection(node1, node2, angle1, angle2, colory, thickness);
    allConnections = (connection[])append(allConnections, singleCon);
    rotater = rotatery;
    return singleCon;
  }

  void draw(boolean big) {


    pushStyle();
    fill(0);
    stroke(0, 0, 0);
    ellipseMode(RADIUS);
    ellipse(p1, p2, rad, rad);
    popStyle();

    // Draw the connections between numbers
    for (int i = 0; i < allConnections.length; i++ ) {     
      connection singleCon = allConnections[i];
      boolean highlight = isNear(singleCon);
      allConnections[i].draw(p1, p2, rad, rotater, highlight, big);
    }
    drawNums(big);
    if (big)
    {
      drawColors();   
      if (!draw1 && !draw2 && !draw3)
      {
        drawNumberArcs(d0, d1, d2, d3, d4, d5, d6, d7, d8, d9);
      }
      if (draw1)
      {
        drawNumberArcs(d0, d1, d2, d3, d4, d5, d6, d7, d8, d9);
      }  
      if (draw2)
      {
        drawNumberArcs(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9);
      }
      if (draw3)
      {
        drawNumberArcs(c0, c1, c2, c3, c4, c5, c6, c7, c8, c9);
      }

      if (mousePressed)
      {
        if (mouseX < 660 && mouseX > 640 && mouseY < 560 && mouseY > 540)
        {
          draw1 = true;
          drawColor1();
        }
        if (mouseX < 710 && mouseX > 690 && mouseY < 560 && mouseY > 545)
        {
          draw2 = true;
          drawColor2();
        }
        if (mouseX < 760 && mouseX > 740 && mouseY < 560 && mouseY > 545)
        {
          draw3 = true;
          drawColor3();
        }
      }
    }
  }

  void drawNums(boolean bigFlag) {
    pushStyle();
    textFont(font);
    textAlign(CENTER, BOTTOM);

    for ( int i = 0; i < nums.length; i++ ) {
      float angle = TWO_PI - TWO_PI * (float)i / (float)nums.length;

      pushMatrix();
      translate(p1, p2);                  
      rotate(angle);                       
      translate(rad + 10, 0); 
      rotate(HALF_PI);                       

      color backColor = color(192, 192, 192);

      boolean highlighted = isMouseNearAngle( angle );

      if (highlighted&&bigFlag) {
        backColor = color(255, 255, 255);
      }

      fill(backColor);
      noStroke();
      rectMode(CENTER);
      rect(0, -12 / 2, 12 + 4, 12 + 4, 3);

      fill(0);
      text(nums[i], 0, 0);

      popMatrix();
    }

    popStyle();
  }
  void changeSize(int wid, int heigh, int radius)
  {
    p1 = wid;
    p2 = heigh;
    rad = radius;
  }

  boolean isNear(connection c) {

    float mouseAngle = getMouseAngle();
    if ( isMouseNearAngle(c.loc1) ) return true;
    if ( isMouseNearAngle(c.loc2) ) return true;
    return false;
  }

  boolean isMouseNearAngle(float angle) {
    float mouseAngle = getMouseAngle();
    if (mouseAngle < 0) return false;  
    if ( (mouseAngle < PI/12) && (angle > (TWO_PI - PI/12)) ) {
      return true;
    }
    float angleDiff = angle - mouseAngle;
    if ( abs(angleDiff) < PI/12 ) {
      return true;
    }
    return false;
  }

  float getMouseAngle() {
    float distFromCenter = dist(p1, p2, mouseX, mouseY);
    boolean test = ((distFromCenter > (0.7*rad)) && (distFromCenter < (rad+26)));
    if (!test) return -1;
    float angle = acos((mouseX - p1) / distFromCenter);
    if ( (mouseY - p2) < 0 ) angle = TWO_PI - angle;

    return angle;
  }



  /* ADDED */
  void drawNumberArcs(color c0, color c1, color c2, color c3, color c4, color c5, color c6, color c7, color c8, color c9)
  {

    pushStyle();
    angles = new ArrayList();
    pushStyle();
    float xr = 400; 
    float yr = 310;
    //36
    //outer
    noFill();
    stroke(c0);
    strokeWeight(7); 
    arc(xr, yr, xr+105, yr+200, 0, PI/5);
    angles.add(0);
    angles.add(PI/5);


    //72
    //outer
    noFill();
    stroke(c1);
    strokeWeight(7);
    arc(xr, yr, xr+105, yr+200, PI/5, (72*PI)/180);
    angles.add((72*PI)/180);



    //108
    //outer
    noFill();
    stroke(c2);
    strokeWeight(7);
    arc(xr, yr, xr+105, yr+200, (72*PI)/180, (108*PI)/180);
    angles.add((108*PI)/180);


    //144
    //outer
    noFill();
    stroke(c3);
    strokeWeight(7);
    arc(xr, yr, xr+105, yr+200, (108*PI)/180, (144*PI)/180);
    angles.add((144*PI)/180);


    //180
    //outer
    noFill();
    stroke(c4);
    strokeWeight(7);
    arc(xr, yr, xr+105, yr+200, (144*PI)/180, (180*PI)/180);
    angles.add((180*PI)/180);



    //216
    //outer
    noFill();
    stroke(c5);
    strokeWeight(7);
    arc(xr, yr, xr+105, yr+200, (180*PI)/180, (216*PI)/180);
    angles.add((216*PI)/180);

    //252
    //outer
    noFill();
    stroke(c6);
    strokeWeight(7);
    arc(xr, yr, xr+105, yr+200, (216*PI)/180, (252*PI)/180);
    angles.add((252*PI)/180);

    //288
    //outer
    noFill();
    stroke(c7);
    strokeWeight(7);
    arc(xr, yr, xr+105, yr+200, (252*PI)/180, (288*PI)/180);
    angles.add((288*PI)/180);

    //324
    //outer
    noFill();
    stroke(c8);
    strokeWeight(7);
    arc(xr, yr, xr+105, yr+200, (288*PI)/180, (324*PI)/180);
    angles.add((324*PI)/180);

    //360
    //outer
    noFill();
    stroke(c9);
    strokeWeight(7);
    arc(xr, yr, xr+105, yr+200, (324*PI)/180, (360*PI)/180);
    angles.add((360*PI)/180);

    popStyle();
  }


  /* ADDED */
  void drawLabels(float num)
  {
    float x = mouseX;
    float y = mouseY;
    float labelWidth = textWidth(""+num);
    // find bounds of circle
    if (inBounds() == true)
    {
      drawText(num, x, y);
    }
  }

  /* ADDED */
  boolean inBounds()
  {    
    float xr = width/2;
    float yr = height/2;
    float x = mouseX;
    float y = mouseY;
    // distance formula
    float xdist = xr-x;
    float ydist = yr-y;
    xdist = pow(xdist, 2);
    ydist = pow(ydist, 2);   
    float dist = xdist + ydist;
    dist = sqrt(dist);
    if (dist <= rad)
    {     
      return true;
    }
    return false;
  }

  /* ADDED */
  void drawText(float num, float x, float y)
  {
    // text box size
    String angle = str(num); 
    float textDim = textWidth(angle);
    noFill();
    stroke(255);
    rect(x, y-15, textDim+5, 18);

    // x and y points of width
    float x1, y1, x2, y2;
    x1 = mouseX;
    y1 = mouseY;
    x2 = mouseX+textDim;
    y2 = y1;   

    // draw text
    fill(255);
    text(angle, x+5, y-5);
  }

  void drawColors()
  {

    fill(192, 192, 192);
    noStroke();
    rect(750, 545, 12 + 4, 12 + 4, 3);
    rect(700, 545, 12 + 4, 12 + 4, 3);
    rect(650, 545, 12 + 4, 12 + 4, 3);

    textFont(font, 12);
    font = createFont("Georgia", 12);
    stroke(0);
    fill(0);
    text("3", 753, 555);
    text("2", 703, 555);
    text("1", 653, 555);

    c0 = color(141, 211, 199);
    c1 = color(255, 255, 179);
    c2 = color(190, 186, 218);
    c3 = color(251, 128, 114);
    c4 = color(128, 177, 211);
    c5 = color(253, 180, 98);
    c6 = color(179, 222, 105);
    c7 = color(252, 205, 229);
    c8 = color(217, 217, 217);
    c9 = color(188, 128, 189);

    fill(c0);
    rect(750, 570, 15, 15);
    fill(c1);
    rect(750, 585, 15, 15);
    fill(c2);
    rect(750, 600, 15, 15);
    fill(c3);
    rect(750, 615, 15, 15);
    fill(c4);
    rect(750, 630, 15, 15);
    fill(c5);
    rect(750, 645, 15, 15);
    fill(c6);
    rect(750, 660, 15, 15);
    fill(c7);
    rect(750, 675, 15, 15);
    fill(c8);
    rect(750, 690, 15, 15);
    fill(c9);
    rect(750, 705, 15, 15);

    C0 = color(145, 104, 72);
    C1 = color(59, 141, 137);
    C2 = color(13, 116, 182);
    C3 = color(245, 179, 144);
    C4 = color(190, 214, 120);
    C5 = color(160, 160, 160);
    C6 = color(166, 217, 238);
    C7 = color(102, 0, 51);
    C8 = color(178, 102, 255);
    C9 = color(255, 102, 102);

    fill(C0);
    rect(700, 570, 15, 15);
    fill(C1);
    rect(700, 585, 15, 15);
    fill(C2);
    rect(700, 600, 15, 15);
    fill(C3);
    rect(700, 615, 15, 15);
    fill(C4);
    rect(700, 630, 15, 15);
    fill(C5);
    rect(700, 645, 15, 15);
    fill(C6);
    rect(700, 660, 15, 15);
    fill(C7);
    rect(700, 675, 15, 15);
    fill(C8);
    rect(700, 690, 15, 15);
    fill(C9);
    rect(700, 705, 15, 15);

    d0 = color(166, 206, 227);
    d1 = color(31, 120, 180);
    d2 = color(178, 223, 138);
    d3 = color(51, 160, 44);
    d4 = color(251, 154, 153);
    d5 = color(227, 26, 28);
    d6 = color(253, 191, 111);
    d7 = color(255, 127, 0);
    d8 = color(202, 178, 214);
    d9 = color(106, 61, 154);

    fill(d0);
    rect(650, 570, 15, 15);
    fill(d1);
    rect(650, 585, 15, 15);
    fill(d2);
    rect(650, 600, 15, 15);
    fill(d3);
    rect(650, 615, 15, 15);
    fill(d4);
    rect(650, 630, 15, 15);
    fill(d5);
    rect(650, 645, 15, 15);
    fill(d6);
    rect(650, 660, 15, 15);
    fill(d7);
    rect(650, 675, 15, 15);
    fill(d8);
    rect(650, 690, 15, 15);
    fill(d9);
    rect(650, 705, 15, 15); 
    
  }

  void drawColor1()
  {
    drawColorSelection(1);
    draw2 = false;
    draw3 = false;
  }

  void drawColor2()
  {
    drawColorSelection(2);
    draw1 = false;  
    draw3 = false;
  }

  void drawColor3()
  {
    drawColorSelection(3);
    draw1 = false;
    draw2 = false;
  }
  
    boolean draw_1()
  {
    return draw1;
  }

  boolean draw_2()
  { 
    return draw2;
  }

  boolean draw_3()
  {
    return draw3;
  }
}

