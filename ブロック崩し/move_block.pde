
void move_block() {

  rect(xx, 150, 60, 2);
  rect(xx+100, 200, 60, 2);
  rect(xx-100, 300, 60, 2);
  rect(xx+50, 350, 60, 2);
  rect(xx-50, 400, 60, 2);
  rect(xx+300, 200, 60, 2);
  rect(xx-300, 200, 60, 2);


  if (xx+160>width) {
    xv=-xv;
  }
  if (xx-100<0) {
    xv=-xv;
  }
  if (y==152&&x>xx&&x<xx+60) {
    dy*=-1;
  }
  if (y==200&&x>xx+100&&x<xx+160) {
    dy*=-1;
  }
  if (y==300&&x>xx-100&&x<xx-40) {
    dy*=-1;
  }
  if (y==352&&x>xx+50&&x<xx+110) {
    dy*=-1;
  }
  if (y==400&&x>xx-50&&x<xx+10) {
    dy*=-1;
  }
  if (y==200&&x>xx+300&&x<xx+360) {
    dy*=-1;
  }  
  if (y==200&&x>xx-300&&x<xx-240) {
    dy*=-1;
  }
  xx+=xv ;
}
