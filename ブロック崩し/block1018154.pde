//エラーが起こる場合、ライブラリを追加する
import processing.sound.*;
SoundFile hit1,hit2,hit3,hit4;






void setup() {
  hit2=new SoundFile(this,"game_maoudamashii_1_battle35.mp3");
  hit4=new SoundFile(this,"swordman-start1.mp3");
  hit4.play();
    hit2.play();
   hit2.loop();
    
  size(700, 600);
  for (int m=0; m<5; m++) {  
    for (int n=0; n<10; n++) {
      hit[m][n]=1;
    }
  }
}
float xx=350;
float x=200;
float y=400;

//バーのパラメーター
int bar_w=50; // バーの幅
int bar_h=5;// バーの高さ
int bar_x=350 ;    // バーのx座標
int bar_y=500 ;    // バーのy座標

// ボールのパラメータ                 
float ball_x =10 ;  // ボールのx座標
float ball_y =10;   // ボールのy座標
float dx = 4; // ボールの速さ(x方向)
float dy = 4; // ボールの速さ(y方向)

//テキスト表示
int life=3;
int score=0;
int time=30;

int hit[][]=new int[5][10];
float xv=2;
int sts=0;

void draw(){ 
  println(sts);
  
switch(sts){
case 0:gameop();
break;
case 1:gamepl();
break;
case 2:gameov();
break;
}
}

void gamepl(){  if (x>width) {
    dx=-4;
  } else if (x<0) {
    dx=4;
  }

  if (y>height) {
    dy=-4;
  } else if (y<0) {
    dy=4;
  }
  x=x+dx;
  y=y+dy;
  noStroke();
  background(0);
  move_block();
  ellipse(x, y, 10, 10);
  fill(200, 155, 155);  
  rect(bar_x, bar_y, bar_w, bar_h);
  bar_x = mouseX - bar_w/2;
  // バーが画面外にある場合の処理
  if (bar_x > width - bar_w) {
    bar_x = width - bar_w;
  }
  if (bar_x < 0) {
    bar_x = 0;
  }
  if (500<=y&&505>=y&&mouseX-25<=x&&mouseX+25>=x) {
    dy=-4;
  
  }
  showblock();
  if(y==height){
    life=life-1;
    x=200;y=400;
  }
  if(life==0){
    sts=2;
  }
  fill(255);
  textSize(30);
  text("life"+life,0,580);
  text("score"+score,100,580);
}
