String dw[] = {"SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"};
String data[];
int unit_n[][] = new int[7][]; // number of time unit
int unit_k[][] = new int[7][]; // kind of time unit

int getDayOfWeek(String s) {
  for (int i = 0; i < 7; i++) {
    if (s.equals(dw[i])) {
      return i;
    }
  }
  return -1;
}

boolean  loadData(String fn) {
  String d[];
  String n[] = {"", "", "", "", "", "", ""};
  String k[] = {"", "", "", "", "", "", ""};
  int dow, sum, i, j;

  data = loadStrings(fn);
  for (i = 0; i < data.length; i++) {
    // sprit one line to 3 strings
    // ex) "SUN,1,28" -> "SUN","1","28"
    d = data[i].split(",");
    dow = getDayOfWeek(d[0]); // dow is for day-of-week
    k[dow] += (d[1]+","); // concatenate only kind part
    n[dow] += (d[2]+","); // concatenate only time part
  }

  for (i = 0; i < 7; i++) {
    unit_k[i] = int(k[i].split(","));
    unit_n[i] = int(n[i].split(","));
  }

  for (i = 0; i < 7; i++) {
    // check the sum of time-unit for each day-of-week 
    sum = 0;
    for (j = 0; j < unit_n[i].length; j++) { 
      // unit_k[i][j]
      sum += unit_n[i][j];
    }

    if (sum != 96) {
      println("Data Error: The sum of quarter-hour-unit for "+dw[i]+ " is "+ sum +".");
      return false;
    }
  }

  return true;
}


void setColor(int i) {
  fill(i*50, i*30*i, i*10);
}

void showGraph(float x, float y, int k[], int n[]) {
  float w, h, dy;

  for (int i = 0; i < n.length; i++) {
    if (k[i] == 2) {
      dy =  -12;
      h = 32;
    } else if (k[i] == 3) {
      dy = - 4;
      h = 16;
    } else {
      dy = 0;
      h = 8;
    }

    // the length of one time-unit on the window is 5
    w = n[i] * 4; 
    // draw the box
    setColor(k[i]-1);
    stroke(0);
    rect(x+30, y, w, 10);
    // move the current position to the right end of the box
    x += w;
  }
}


void week() {
  image(haikei, 0, 0, width, height);//背景表示
  fill(250.200, 200);
  stroke(0);
  rect(40, 100, 400, 200);//横グラフの枠を表示
  stroke(0);
  fill(128, 255, 128);
  image(home, 15, 8, 50, 50);//ホームボタンの表示
  textSize(10);
  float x, y;

  for (int i = 0; i < 7; i++) {
    fill(250);   
    rect(55, 262, 368, 21);////色説明のための枠
    strokeWeight(1);
    // show text data line by line
    fill(0);
    x = 20;
    y = (i + 6) * 20;
    textSize(10);
    text(dw[i], x+30, y);    
    showGraph(x, y, unit_k[i], unit_n[i]);

    fill(50, 30, 10);
    rect(60, 265, 15, 15);
    fill(100, 120, 20);
    rect(130, 265, 15, 15);
    fill(150, 255, 30);
    rect(200, 265, 15, 15);
    fill(200, 255, 40);
    rect(270, 265, 15, 15);
    fill(250, 255, 50);
    rect(340, 265, 15, 15);
    //各　色の説明の表示
    fill(0);
    textSize(15);
    text("自習", 80, 278);
    text("授業", 150, 278);
    text("余暇", 220, 278);
    text("睡眠", 290, 278);
    text("バイト", 360, 278);
  }
  //以下一週間のグラフ表示
  fill(250.200, 200);
  stroke(0);
  strokeWeight(5);
  rect(40, 320, 400, 290);//グラフの枠
  fill(0);
  //↓メモリ表示
  for (int i=1; i<=9; i++) {
    strokeWeight(3);
    if (i==5) {
      line(80, 340+i*23, 105, 340+i*23);
    }
    line(80, 340+i*23, 95, 340+i*23);
  }
  strokeWeight(0.5);
  for (int j=1; j<=99; j++) {
    if (j%5==0) {
      line(80, 340+j*2.3, 95, 340+j*2.3);
    }
    line(80, 340+j*2.3, 90, 340+j*2.3);
  }
  text("8", 60, 391);
  text("6", 60, 437);
  text("4", 60, 483);
  text("2", 60, 529);
  text("0", 65, 575);
  text("10", 50, 345);
  if (z1>100) {
    z1=100;
  }
  if (yy1>100) {
    yy1=100;
  }
  if (s1>100) {
    s1=100;
  }
  if (so1>100) {
    so1=100;
  }
  stroke(0);
  fill(50, 30, 10);
  rect(120, 577, 40, 25);
  rect(120, 570-z1*2.3, 40, 0+z1*2.3);
  fill(150, 255, 30);
  rect(190, 577, 40, 25);
  rect(190, 570-yy1*2.3, 40, 0+yy1*2.3);
  fill(200, 255, 40);
  rect(260, 577, 40, 25);
  rect(260, 570-s1*2.3, 40, 0+s1*2.3);
  fill(250, 255, 50);
  rect(330, 577, 40, 25);
  rect(330, 570-so1*2.3, 40, 0+so1*2.3);
  //以下グラフの数値表示

  textSize(12);
  stroke(0);
  strokeWeight(5);
  line(80, 340, 80, 570);
  line(80, 570, 400, 570);
}
