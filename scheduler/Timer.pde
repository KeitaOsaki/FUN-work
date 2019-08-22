void sw() {
  background(0);
  textSize(50); 
  fill(255); 
  text(now(), 130, 230); 
  rect(20, 420, 70, 40, 8); 
  fill(255, 0, 0); 
  rect(200, 420, 70, 40, 8); 
  fill(0, 0, 255); 
  rect(380, 420, 70, 40, 8);
  textSize(20);
  fill(0);
  text("Start", 30, 450);
  text("Reset", 210, 450);
  text("Stop", 390, 450);
  image(home, 15, 8, 50, 50);//ホームボタンの表示
  if (mousePressed&&mouseX<90&&mouseX>20&&mouseY>420&&mouseY<460&&s==0) {//最初のスタート 
    start=1; 
    s=millis();//最初のスタートのmillis()の固定値
  }  
  if (mousePressed&&mouseX<270&&mouseX>200&&mouseY>420&&mouseY<460) {//リセット 
    count=count+1; 
    s=millis(); 
    t=0; 
    start=0; 
    o=0;//秒経過時間を０にして、リセットできるようにする 
    m=0;//分のリセット
  } 
  if (mousePressed&&mouseX<450&&mouseX>380&&mouseY>420&&mouseY<460) {//ストップ 
    u=t;//ストップ時のタイマーの値を記憶  
    start=0; 
    count1=count1+1;
  } 
  if (start==0) { 
    o=millis()-s-t;//タイマーがストップしているときの経過時間
  } 
  if (start==1&&count==0) {//時間の再生 
    t=millis()-s;//最初のスタートからの時間
  } 
  if (start==1&&count>0) {//再スタート２ 
    t=millis()-s-o;//ストップしている間の経過時間を引いたもの
  } 
  if (mousePressed&&mouseX<60&&mouseX>20&&mouseY>420&&mouseY<460&&start==0) {//再スタート1 
    start=1;
  } 
  for (int i=1; i<100; i=i+1) { 
    if (t>60000) { 
      t=t-60000; 
      m=i;
    }
  } 
  println(t);
}
String conv2(int i) { 
  String s1, s2; 
  s1 = String.valueOf(i / 10); 
  s2 = String.valueOf(i % 10); 
  return s1+s2;
} 
String conv1(int i) { 
  String s1, s2; 
  s1 = String.valueOf(i / 10); 
  s2 = String.valueOf(i % 10); 
  return s1+s2;
} 
String now() { 

  return(conv1(m)+":"+conv1(t/1000)+":"+conv2(int(t%1000/10)));
}
