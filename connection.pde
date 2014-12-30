class connection {
  String node1, node2;
  float loc1, loc2;
  float line = 0.1;
  color colory = color(250);

  connection(String node1, String node2, float loc1, float loc2, color colory, float line) {
    this.node1 = node1;
    this.node2 = node2;
    this.loc1 = loc1;
    this.loc2 = loc2;
    this.colory = colory;
    this.line = line;
  }
  //Add highlighting add boolean flag
  void draw(int p1, int p2, int radius, int rotater, boolean highFlag, boolean bigFlag) {
    pushStyle();
    float x1, x2, x3, x4, y1, y2, y3, y4;
    //Need four for bezier
    //Formulas obtained from processing reference pages
    //X VALS
    x1 = p1 + radius * cos(loc1+rotater);
    x2 = p1 + 0.5 * radius * cos(loc1);
    x3 = p1 + 0.5 * radius * cos(loc2);
    x4 = p1 + radius * cos(loc2);
    //Y VALS
    y1 = p2 + radius * sin(loc1+rotater);
    y2 = p2 + 0.5 * radius * sin(loc1);
    y3 = p2 + 0.5 * radius * sin(loc2);
    y4 = p2 + radius * sin(loc2) ;
    noFill();
    stroke(colory);
    strokeWeight(0.2);

    if (highFlag&&bigFlag)
    {
      stroke(255,255,255);
      strokeWeight(2);
    }    

    bezier(x1, y1, x2, y2, x3, y3, x4, y4);

    popStyle();
  }
}

