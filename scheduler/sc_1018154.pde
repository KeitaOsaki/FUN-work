int page = 0;
int count=0;
int a1=0, a2=0, a3=0, a4=0;
int count2=0;
int b1, b2, b3, b4;
int count3=0;
int c1, c2, c3, c4;
int y=year();
int m=month();
int y1, y2;
int w, w1, w2, w3;
int yy=230;
int z1=0;//グラフ（自習）増加のための置き換え
int yy1=0;//グラフ（余暇）増加のための置き換え
int s1=0;//グラフ（睡眠）増加のための置き換え
int so1=0;//グラフ（その他）増加のための置き換え
int s=0, t=0, u=0, o=0; 
int start; 
int count1=0; 
PImage img, haikei, home, ahome, ck, gra, calen, sister;
void setup() {
  y1=y/100;
  y2=y%100;
  size(480, 640);
  background(0, 0, 50);
  noStroke();
  PFont font = createFont("MS ゴシック", 48, true);
  textFont (font);
  img=loadImage("2.jpg");
  haikei=loadImage("1.jpg");
  calen=loadImage("3.png");
  gra=loadImage("13.png");
  ck=loadImage("11.png");
  home=loadImage("4.jpg");
  sister=loadImage("s.jpg");
  loadData("week1_1018154.txt");
}

void mouseClicked() {
  if (20<mouseX&&mouseX<60&&20<mouseY&&mouseY<50) {//ホームボタン
    page= 0;
  }
  if (mouseY > 510 && mouseY < 575) {    //各ページへの切り替えボタン
    if (50<mouseX && mouseX<150) { 
      page= 1; // カウンターページへのボタン
    } else if (190<mouseX && mouseX< 290) {
      page = 2;//カレンダーページへのボタン
    } else if (330<mouseX && mouseX<430) {
      page = 3;//グラフページへのボタン
    }
  }
  if (130<mouseY&&mouseY<150) {//年月の増減ボタン
    if (360<mouseX&&mouseX<380) {
      m+=1;   //年月の増加ボタン
    } else if (100<mouseX&&mouseX<120) {
      m-=1; //年月の減少ボタン
    }
    if (m>12&&360<mouseX&&mouseX<380) {
      m=1;//月を1月に切り替え
      y+=1;//年の増加
    }
    if (m<1&&100<mouseX&&mouseX<120) {
      m=12;//月を12月に切り替え
      y-=1;//年の減少
    }
  }
  //グラフ値増加ボタン
  if (577<mouseY&&mouseY<602) {
    if (120<mouseX&&mouseX<160) {
      z1+=10;//グラフ（自習）の増加ボタン
    }
    if (190<mouseX&&mouseX<230) {
      yy1+=10;//グラフ（余暇）の増加ボタン
    }
    if (260<mouseX&&mouseX<300) {
      s1+=10;//グラフ（睡眠）の増加ボタン
    }
    if (330<mouseX&&mouseX<360) {
      so1+=10;//グラフ（その他）の増加ボタン
    }
  }
}

void draw() {
  background(0);
  image(haikei, 0, 0, width, height);
  stroke(0);

  textSize(35);
  fill(0);
  text(year()+"年     "+month()+"月"+day()+"日", 97, 60);//年月日の表示
  stroke(0);
  int s = second();
  clocks(s/60.0, 80);
  int m = minute();
  int h = hour();

  for (int i = 0; i < 3; i++) {//カウンター、カレンダー、グラフページへの切り替えボタンの表示
    if (i==0) {
      fill(255, 50, 50);
    } else if (i==1) {
      fill(50, 50, 255);
    } else if (i==2) {
      fill(50, 255, 50);
    }
    rect(50+i*140, 510, 100, 65);
    fill(0);
  }
  image(ck, 55, 515, 100, 65);
  image(calen, 195, 515, 100, 65);
  image(gra, 335, 515, 100, 65);
  /* show page */
  switch(page) {//ページ切り替えのプログラム
  case 1:
    sw();
    break;
  case 2:
    calen();
    break;
  case 3:
    week();
    break;
  default:
    break;
  }
}
