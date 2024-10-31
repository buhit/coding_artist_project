// 석도준 캐릭터 : 캐릭터 3
// show : 동그란 웃는 얼굴을 그린다.
// move : 마우스 포인터를 따라 움직인다
// change_size : 'p','l' 키를 누르면 캐릭터의 사이즈를 키우거나 줄일 수 있다.
// change_speed : 'c' 키를 누르면 캐릭터의 색깔을 바꿀 수 있다. 

class char3 {
  // constructor
  char3() {
    d = 10;
    c = 1;
  }
  // member data
  float x, y, d, c;
  // member function
  void show() {
    if (c == 1) fill(200, 0, 200);
    else if (c == 2) fill(0, 200, 200);
    else if (c == 3) fill(200, 200, 0);
    else if (c == 4) fill(200, 200, 0);
    else if (c == 5) fill(100, 200, 125);
    else if (c == 6) fill(200, 150, 75);
    circle(x-5*d, y-0.5*d, 2*d);
    circle(x+5*d, y-d, 2*d);
    circle(x, y, 10*d);
    circle(x-2*d, y-d, 3*d);
    circle(x+2*d, y-d, 3*d);
    arc(x, y+2*d, 3*d, 3*d, 0, PI);
  }
  void move() {
    x = mouseX;
    y = mouseY;
  }
  void change_size(char kk) {
    if (kk == 'p') d += 3;
    else if (kk == 'l') d -= 4;
  }
  void change_color(char kk) {
    if (kk == 'c') {
      if (c == 6) c = 1;
      else c += 1;
    }
  }
}
