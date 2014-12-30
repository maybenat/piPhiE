//CS 5630 Final Project
int [] piFreq, eFreq, phiFreq;
String []data, numbers;
byte[] data2;
connectionGraph Graph, Graph2, Graph3;
boolean smallFlag, pi, phi, e;
PFont font;
PImage Img8, Img2;
String graphName;
int count = 0;
boolean Pi, Phi, E;
color c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, C0, C1, C2, C3, C4, C5, C6, C7, C8, C9;
color d0, d1, d2, d3, d4, d5, d6, d7, d8, d9;

int colorOption = 0;

int mouseCount;
PrintWriter piWriter, phiWriter, eWriter;
String[] largerPi, largerPhi, largerE;
String piFile, phiFile, eFile;
int piSize, phiSize, eSize;

final static String[] nums = {
  "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
};

char[] charVals;

void setup()
{
  size(800, 800);
  piFreq = new int[10];
  eFreq = new int[10];
  phiFreq = new int[10];
  Graph = new connectionGraph(125, 300, 100, nums, false);
  Graph2 = new connectionGraph(400, 300, 100, nums, false);
  Graph3 = new connectionGraph(675, 300, 100, nums, false);
  dataReader("mini_pi.txt", Graph, "pi");
  dataReader("eTest.txt", Graph2, "e");
  dataReader("phiTest.txt", Graph3, "phi");
  smooth();
  frameRate(20);
  smallFlag = true;
  pi = false;
  phi = false;
  e = false;
  Pi = false;
  Phi = false;
  E = false;

  // initialize colors
  /* 3 */
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
  /* 2 */
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
  /* 1 */
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
}

void draw()
{
  if (smallFlag)
  {
    Img8 = loadImage("pi.png");
    image(Img8, 90, 100);
    Img2 = loadImage("phi.png");
    image(Img2, 640, 100);
    font = createFont("Times", 32);
    textFont(font, 90);
    fill(0);
    text("e", 375, 150);
    Graph.draw(false);
    Graph2.draw(false);
    Graph3.draw(false);
  }
  if (!smallFlag)
  {
    if (pi)
    {
      Pi = pi;
      Graph.changeSize(400, 310, 250);
      background(0);
      Graph.draw(true);
      textFont(font, 18);
      font = createFont("Helvetica", 20);
      stroke(255);
      fill(255);
      text("BACK", 50, 50);
      /* */
      text("SAVE", 700, 50);

      textSize(13);
      text("Load Points", 700, 100);
      noFill();
      rect(695, 80, 80, 30);     
      if (mouseCount*100 < 2000)
      {
        drawFreq("pi");
      }
    }
    else if (e)
    {
      E = e;
      Graph2.changeSize(400, 310, 250);
      background(0);
      Graph2.draw(true);
      textFont(font, 18);
      font = createFont("Helvetica", 20);
      stroke(255);
      fill(255);
      text("BACK", 50, 50);

      text("SAVE", 700, 50);
      textSize(13);
      text("Load Points", 700, 100);
      noFill();
      rect(695, 80, 80, 30);
      if (mouseCount*100 < 2000)
      {
        drawFreq("e");
      }
    }
    else if (phi)
    {
      Phi = phi;
      Graph3.changeSize(400, 310, 250);
      background(0);
      Graph3.draw(true);
      textFont(font, 18);
      font = createFont("Helvetica", 20);
      stroke(255);
      fill(255);
      text("BACK", 50, 50);
      text("SAVE", 700, 50);
      textSize(13);
      text("Load Points", 700, 100);
      noFill();
      rect(695, 80, 80, 30);
      if (mouseCount*100 < 2000)
      {
        drawFreq("phi");
      }
    }
  }
  if (mousePressed)
  {    
    if (mouseX < 750 && mouseX > 700 && mouseY > 40 && mouseY < 55)
    {
      textFont(font, 18);
      font = createFont("Helvetica", 20);
      fill(204, 255, 153);
      text("SAVE", 700, 50);
      String img = "image"+count;
      save(img+".png");
      count++;
    }

    if (mouseX < 695+80+10 && mouseX > 670 && mouseY > 85 && mouseY < 110)
    {
      mouseCount++;
      loadPoints();
    }    
    if (mouseX < 225 && mouseY < 400 && mouseY > 200 && mouseX > 25 && smallFlag == true)
    {
      pi = true;
      smallFlag = false;
      phi = false;
      e = false;
    }
    else if (mouseX < 505 && mouseX > 300 && mouseY < 405 && mouseY > 200 && smallFlag == true)
    {
      e = true;
      smallFlag = false;
      pi = false;
      phi = false;
    }
    else if (mouseX < 780 && mouseX > 600 && mouseY < 405 && mouseY > 250  && smallFlag == true)
    {
      phi = true;
      smallFlag = false;
      e = false;
      pi = false;
    }
    if (mouseX < 90 && mouseX > 50 && mouseY < 52)
    {
      background(192, 192, 192);
      smallFlag = true;
      if (pi)
      {
        Graph.changeSize(125, 300, 100);
        Graph.draw(false );
        pi = false;
      }
      if (e)
      {
        Graph2.changeSize(400, 300, 100);
        Graph2.draw(false);
        e = false;
      }

      if (phi)
      {
        Graph3.changeSize(675, 300, 100);
        Graph3.draw(false);
        phi = false;
      }
    }
  }
}

void drawFreq(String name)
{ 
  graphName = name;
  fill(166, 206, 227);
  text("0:", 90, 600);
  if (name.equals("pi"))
    rect(100, 600, piFreq[0], 10);
  else if (name.equals("e"))
    rect(100, 600, eFreq[0], 10);
  else if (name.equals("phi"))
    rect(100, 600, phiFreq[0], 10);


  fill(38, 120, 180);
  text("1:", 90, 630);
  if (name.equals("pi"))
    rect(100, 630, piFreq[1], 10);
  else if (name.equals("e"))
    rect(100, 630, eFreq[1], 10);
  else if (name.equals("phi")) 
    rect(100, 630, phiFreq[1], 10);

  fill(178, 223, 138);
  text("2:", 90, 660);
  if (name.equals("pi"))
    rect(100, 660, piFreq[2], 10);
  else if (name.equals("e"))
    rect(100, 660, eFreq[2], 10);
  else if (name.equals("phi"))
    rect(100, 660, phiFreq[2], 10);

  fill(51, 160, 44);
  text("3:", 90, 690);
  if (name.equals("pi"))
    rect(100, 690, piFreq[3], 10);
  else if (name.equals("e"))
    rect(100, 690, eFreq[3], 10);
  else if (name.equals("phi"))
    rect(100, 690, phiFreq[3], 10);

  fill(251, 154, 153);
  text("4:", 90, 720);
  if (name.equals("pi"))
    rect(100, 720, piFreq[4], 10);
  else if (name.equals("e"))
    rect(100, 720, eFreq[4], 10);
  else if (name.equals("phi"))
    rect(100, 720, phiFreq[4], 10);

  fill(227, 26, 28);
  text("5:", 90, 750);
  if (name.equals("pi"))
    rect(100, 750, piFreq[5], 10);
  else if (name.equals("e"))
    rect(100, 750, eFreq[5], 10);
  else if (name.equals("phi"))
    rect(100, 750, phiFreq[5], 10);

  fill(253, 191, 111);
  text("6:", 290, 600);
  if (name.equals("pi"))
    rect(300, 600, piFreq[6], 10);
  else if (name.equals("e"))
    rect(300, 600, eFreq[6], 10);
  else if (name.equals("phi"))
    rect(300, 600, phiFreq[6], 10);

  fill(255, 127, 0);
  text("7:", 290, 630);
  if (name.equals("pi"))
    rect(300, 630, piFreq[7], 10);
  else if (name.equals("e"))
    rect(300, 630, eFreq[7], 10);
  else if (name.equals("phi"))
    rect(300, 630, phiFreq[7], 10);


  fill(202, 178, 214);
  text("8:", 290, 660);
  if (name.equals("pi"))
    rect(300, 660, piFreq[8], 10);   
  else if (name.equals("e"))
    rect(300, 660, eFreq[8], 10);   
  else if (name.equals("phi"))
    rect(300, 660, phiFreq[8], 10);   


  fill(106, 61, 154);
  text("9:", 290, 690);
  if (name.equals("pi"))
    rect(300, 690, piFreq[9], 10);
  else if (name.equals("e"))
    rect(300, 690, eFreq[9], 10);
  else if (name.equals("phi"))
    rect(300, 690, phiFreq[9], 10);


  fill(255);
}

void dataReader(String filename, connectionGraph Graphy, String name) {
  /* added */
  if (colorOption > 0)
  {
    colorReader(filename, Graphy, name);
  }
  else
  {
    data = loadStrings(filename);
    String datay = data[0];

    char[] allChars = new char[datay.length()];
    charVals = new char[datay.length()];
    for (int i = 2; i < datay.length(); i++) {
      allChars[i] = datay.charAt(i);
      charVals[i] = datay.charAt(i);
    }


    for (int i = 8; i < allChars.length; i++)
    {
      String s = Character.toString(allChars[i]);
      if (s.equals("1")) {
        if (name.equals("pi"))
          piFreq[1] = piFreq[1]+1;
        else if (name.equals("phi"))
          phiFreq[1] = phiFreq[1]+1;
        else if (name.equals("e"))
          eFreq[1] = eFreq[1]+1;
      }
      else if (s.equals("2")) {
        if (name.equals("pi"))
          piFreq[2] = piFreq[2]+1;
        else if (name.equals("phi"))
          phiFreq[2] = phiFreq[2]+1;
        else if (name.equals("e"))
          eFreq[2] = eFreq[2]+1;
      }
      else if (s.equals("3")) {
        if (name.equals("pi"))
          piFreq[3] = piFreq[3]+1;
        else if (name.equals("phi"))
          phiFreq[3] = phiFreq[3]+1;
        else if (name.equals("e"))
          eFreq[3] = eFreq[3]+1;
      }
      else if (s.equals("4")) {
        if (name.equals("pi"))
          piFreq[4] = piFreq[4]+1;
        else if (name.equals("phi"))
          phiFreq[4] = phiFreq[4]+1;
        else if (name.equals("e"))
          eFreq[4] = eFreq[4]+1;
      }
      else if (s.equals("5")) {
        if (name.equals("pi"))
          piFreq[5] = piFreq[5]+1;
        else if (name.equals("phi"))
          phiFreq[5] = phiFreq[5]+1;
        else if (name.equals("e"))
          eFreq[5] = eFreq[5]+1;
      }
      else if (s.equals("6")) {
        if (name.equals("pi"))
          piFreq[6] = piFreq[6]+1;
        else if (name.equals("phi"))
          phiFreq[6] = phiFreq[6]+1;
        else if (name.equals("e"))
          eFreq[6] = eFreq[6]+1;
      }
      else if (s.equals("7")) {
        if (name.equals("pi"))
          piFreq[7] = piFreq[7]+1;
        else if (name.equals("phi"))
          phiFreq[7] = phiFreq[7]+1;
        else if (name.equals("e"))
          eFreq[7] = eFreq[7]+1;
      }
      else if (s.equals("8")) {
        if (name.equals("pi"))
          piFreq[8] = piFreq[8]+1;
        else if (name.equals("phi"))
          phiFreq[8] = phiFreq[8]+1;
        else if (name.equals("e"))
          eFreq[8] = eFreq[8]+1;
      }
      else if (s.equals("9")) {
        if (name.equals("pi"))
          piFreq[9] = piFreq[9]+1;
        else if (name.equals("phi"))
          phiFreq[9] = phiFreq[9]+1;
        else if (name.equals("e"))
          eFreq[9] = eFreq[9]+1;
      }
      else if (s.equals("0")) {
        if (name.equals("pi"))
          piFreq[0] = piFreq[0]+1;
        else if (name.equals("phi"))
          phiFreq[0] = phiFreq[0]+1;
        else if (name.equals("e"))
          eFreq[0] = eFreq[0]+1;
      }
    }
    for (int i = 1; i < allChars.length; i++)
    {
      String s = Character.toString(allChars[i-1]);
      String s2 = Character.toString(allChars[i]);
      color colory = color(0, 0, 0);
      if (s.equals("0"))
      {
        colory = color(166, 206, 227);
      }
      else if (s.equals("1"))
      {
        colory = color(31, 120, 180);
      }
      else if (s.equals("2"))
      {
        colory = color(178, 223, 138);
      }
      else if (s.equals("3"))
      {
        colory = color(51, 160, 44);
      }
      else if (s.equals("4"))
      {
        colory = color(251, 154, 153);
      }
      else if (s.equals("5"))
      {
        colory = color(227, 26, 28);
      }
      else if (s.equals("6"))
      {
        colory = color(253, 191, 111);
      }
      else if (s.equals("7"))
      {
        colory = color(255, 127, 0);
      }
      else if (s.equals("8"))
      {
        colory = color(202, 178, 214);
      }
      else if (s.equals("9"))
      {
        colory = color(106, 61, 154);
      } 
      Graphy.addconnection(s2, s, colory, 0.1, i);
    }
  }
}


void drawColorSelection(int option)
{
  colorOption = option;
  if (Pi)
  {    
    if (option == 1)
    {
      drawColorConnection(d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, Graph);
      colorReader("mini_pi.txt", Graph, "pi");
    }
    if (option == 2)
    {
      drawColorConnection(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, Graph);
      colorReader("mini_pi.txt", Graph, "pi");
    }
    if (option == 3)
    {
      drawColorConnection(c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, Graph);
      colorReader("mini_pi.txt", Graph, "pi");
    }
  }
  if (Phi)
  {
    if (option == 1)
    {
      drawColorConnection(d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, Graph3);
      colorReader("phiTest.txt", Graph3, "phi");
    }
    if (option == 2)
    {
      drawColorConnection(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, Graph3);
      colorReader("phiTest.txt", Graph3, "phi");
    }
    if (option == 3)
    {
      drawColorConnection(c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, Graph3);
      colorReader("phiTest.txt", Graph3, "phi");
    }
  }
  if (E)
  {
    if (option == 1)
    {
      drawColorConnection(d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, Graph2);
      colorReader("eTest.txt", Graph2, "e");
    }
    if (option == 2)
    {
      drawColorConnection(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, Graph2);
      colorReader("eTest.txt", Graph2, "e");
    }
    if (option == 3)
    {
      drawColorConnection(c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, Graph2);
      colorReader("eTest.txt", Graph2, "e");
    }
  }
}

void drawColorConnection(color x0, color x1, color x2, color x3, color x4, color x5, color x6, color x7, color x8, color x9, connectionGraph g)
{
  for (int i = 1; i < charVals.length; i++)
  {
    String s = Character.toString(charVals[i-1]);
    String s2 = Character.toString(charVals[i]);
    color colory = color(0, 0, 0);
    if (s.equals("0"))
    {
      colory = x0;
    }
    else if (s.equals("1"))
    {
      colory = x1;
    }
    else if (s.equals("2"))
    {
      colory = x2;
    }
    else if (s.equals("3"))
    {
      colory = x3;
    }
    else if (s.equals("4"))
    {
      colory = x4;
    }
    else if (s.equals("5"))
    {
      colory = x5;
    }
    else if (s.equals("6"))
    {
      colory = x6;
    }
    else if (s.equals("7"))
    {
      colory = x7;
    }
    else if (s.equals("8"))
    {
      colory = x8;
    }
    else if (s.equals("9"))
    {
      colory = x9;
    }     
    g.addconnection(s2, s, colory, 0.1, i);
  }
}

void colorReader(String filename, connectionGraph Graphy, String name) {
  data = loadStrings(filename);
  String datay = data[0];

  char[] allChars = new char[datay.length()];
  charVals = new char[datay.length()];
  for (int i = 2; i < datay.length(); i++) {
    allChars[i] = datay.charAt(i);
    charVals[i] = datay.charAt(i);
  }
  if (colorOption == 1)
  {
    drawColorConnection(d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, Graphy);
  }
  if (colorOption == 2)
  {
    drawColorConnection(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, Graphy);
  }
  if (colorOption == 3)
  {
    drawColorConnection(c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, Graphy);
  }
}


void loadPoints()
{
  if (pi)
  {
    pointsReader("pi_limit.txt");
    dataReader("larger_pi.txt", Graph, "pi");
    textSize(10);
    fill(255);
    text(fileSize(), 700, 150);
    Graph.draw(false);
  }
  else if (phi)
  {
    pointsReader("phi_limit.txt");
    dataReader("larger_phi.txt", Graph3, "phi");
    textSize(10);
    fill(255);
    text(fileSize(), 700, 150);
    Graph3.draw(false);
  }
  else
  {
    pointsReader("e_limit.txt");
    dataReader("larger_e.txt", Graph2, "e");
    textSize(10);
    fill(255);
    text(fileSize(), 700, 150);
    Graph2.draw(false);
  }
}

void pointsReader(String filename)
{
  if (mouseCount > 10)
  {
    textSize(13);
    fill(255, 0, 0);
    text("Exceeded file size", 700, 150);
  }
  /* pi */
  if (filename == "pi_limit.txt")
  {
    largerPi = loadStrings(filename);
    String piData = largerPi[0];
    char[] piVals = new char[piData.length()];
    for (int i = 2; i < piData.length(); i++)
    {
      piVals[i] = piData.charAt(i);
    }    
    piFile = "larger_pi.txt";
    piWriter = createWriter(piFile);
    for (int i = 0; i < mouseCount*100; i++)
    {
      piWriter.print(piVals[i]);
    }
    piWriter.close();
  }

  if (filename == "phi_limit.txt")
  {
    largerPhi = loadStrings(filename);
    String phiData = largerPhi[0];
    char[] phiVals = new char[phiData.length()];
    for (int i = 2; i < phiData.length(); i++)
    {
      phiVals[i] = phiData.charAt(i);
    }    
    phiFile = "larger_phi.txt";
    phiWriter = createWriter(phiFile);
    for (int i = 0; i < mouseCount*100; i++)
    {
      phiWriter.print(phiVals[i]);
    }
    phiWriter.close();
  }

  if (filename == "e_limit.txt")
  {
    largerE = loadStrings(filename);
    String eData = largerE[0];
    char[] eVals = new char[eData.length()];
    for (int i = 2; i < eData.length(); i++)
    {
      eVals[i] = eData.charAt(i);
    }    
    eFile = "larger_e.txt";
    eWriter = createWriter(eFile);
    for (int i = 0; i < mouseCount*100; i++)
    {
      eWriter.print(eVals[i]);
    }
    eWriter.close();
  }
}

String fileSize()
{
  int ret = mouseCount*100;
  return Integer.toString(ret);
}

