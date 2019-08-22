void showblock() {
  int ref;
  for (int m=0; m<5; m++) {  
    for (int n=0; n<10; n++) {
      if (hit[m][n]>0) {
        stroke(0);
        rect(70*n, 20*m, 70, 20);
        ref=checkHitBlock(m, n, x, y);
        switch (ref) {
        case 1:
          hit[m][n]--;
        case 2:
        case 8:
            score+=100;
          break;
        case 5:
          hit[m][n]--;
        case 4:
        case 6:
          dy = -dy;
            score+=100;
                    break;
        }
        switch (ref) {
        case 2:
        case 3:
        case 4:
         score+=100;
          break;
        case 6:
        case 7:
        case 8:
          dx = -dx;
            score+=100;
          break;
        }
      }
    }
  }
}
int checkHitBlock(int m, int n, float x, float y) {
  float left   = 70* n;
  float right  = 70 * (n + 1);
  float top    = 20*m;
  float bottom = 20*(m+1);
  float cx = left + 70/ 2;
  float cy = top + 70 / 2;
  float y1, y2;

  if ((x  <= left) ||
    (x >= right) ||
    (y <= top) ||
    (y >= bottom)) {
    return 0;
  }


  y1 = y - (-(x - cx)* 20 / 70 + cy);
  y2 = y - ( (x - cx)* 20 / 70 + cy);

  if (y1 > 0) {
    if (y2 > 0) {
      return 1;
    } else if (y2 == 0) {
      return 2;
    } else {
      return 3;
    }
  } else if (y1 < 0) {
    if (y2 > 0) {
      return 7;
    } else if (y2 == 0) {
      return 6;
    } else {
      return 5;
    }
  } else {
    if (y2 > 0) {
      return 8;
    } else if (y2 == 0) {
      return -1;
    } else {
      return 4;
    }
  }
}
