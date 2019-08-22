void gameop(){
xx=350;
x=200;
y=400;

//バーのパラメーター
bar_w=50; // バーの幅
bar_h=5;// バーの高さ
bar_x=350 ;    // バーのx座標
bar_y=500 ;    // バーのy座標

// ボールのパラメータ                 
ball_x =10 ;  // ボールのx座標
ball_y =10;   // ボールのy座標
dx = 4; // ボールの速さ(x方向)
dy = 4; // ボールの速さ(y方向)

//テキスト表示
life=3;
score=0;
time=30;

  background(0);
  textSize(100);
text("start",250,height/2);
if(mousePressed){
 sts=1; 
 
}

}

void gameov(){
  textSize(100);
text("Game over",width/6,height/2+100);
if(keyPressed){
 sts=0; 
}
}
