void clocks(float rat, float r) {
  text(hour()+":"+minute()+":"+second(), 180, 380);
  int s = second(); 
  int m = minute(); 
  int hr = hour(); 
  float w=240; 
  float h = 250; 
  noStroke(); 
  fill(50); 
  ellipse(w, h, 180, 180); 
  fill(255); 
  noStroke(); 
  for (int i=0; radians(i)<TWO_PI; i+=6) { 
    ellipse(w+cos(radians(i))*85, h+sin(radians(i))*85, 1, 1);
  } 
  for (int i=0; radians(i)<TWO_PI; i+=30) { 
    ellipse(w+cos(radians(i))*85, h+sin(radians(i))*85, 4, 4);
  } 
  // textAlign(CENTER); 
  textSize(20); 
  text("12", w-12, h-65); 
  text("3", w+70, h+8); 
  text("6", w-5, h+80); 
  text("9", w-80, h+8); 
  stroke(255); 
  strokeWeight(1); 
  show_arm(s/60.0, 80, w, h); 
  strokeWeight(3); 
  show_arm(m/60.0+s/3600.0, 80, w, h); 
  strokeWeight(5); 
  show_arm(hr/12.0+m/720.0, 40, w, h);
} 

void show_arm(float rat, float r, float x, float y) { 
  float x1, y1; 
  float theta; 

  theta = TWO_PI * rat - PI / 2.0; 
  x1 = x + r * cos(theta); 
  y1 = y + r * sin(theta); 
  line(x, y, x1, y1);
}
