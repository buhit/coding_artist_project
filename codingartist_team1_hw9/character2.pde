// 정웅재 캐릭터 : 캐릭터 2 
// show : 넓적한 얼굴을 그린다.
// move : 벽을 튕기면서 움직인다.
// change_size : 'o','k' 키를 누르면 캐릭터의 사이즈를 키우거나 줄일 수 있다.
// change_speed : 'n','m' 키를 누르면 캐릭터의 움직이는 스피드를 늘리거나 줄일 수 있다.

class char2 {
  // constructor
  char2() {
    x = 200;
    y = 200;
    d = 10;
    vx = 10;
    vy = 3;
    s = 1;
  }
  // member data
  float x, y, d, vx, vy, s;
  // member function
  void show() {
    circle(x-5*d, y-0.5*d, 2*d);
    circle(x+5*d, y-d, 2*d);
    circle(x, y, 10*d);
    circle(x-2*d, y-d, 3*d);
    circle(x+2*d, y-d, 3*d);
    arc(x, y+2*d, 3*d, 3*d, 0, PI);

    stroke(255, 192, 203); //핑크색귀 만들기
    strokeWeight(10);
    circle(x-2.5*d, y-4*d, 4*d);
    circle(x+2.5*d, y-4*d, 4*d);

    fill(251, 206, 177);//살구색얼굴
    stroke(0);//얼굴테두리 및 두께 정상화
    strokeWeight(1);
    ellipse(x, y, 20*d, 10*d); //얼굴

    fill(255); //흰색 눈
    circle(x-4.5*d, y-2.5*d, 4*d);//눈1
    circle(x+4.5*d, y-2.5*d, 4*d);//눈2

    fill(255, 0, 0);//빨간 입
    ellipse(x, y+2.5*d, 10*d, 2.5*d);//입
  }
  void move() {
    x += vx*s;
    y += vy*s;
    if (x<0 || x>width) vx = -vx;
    if (y<0 || y>height) vy = -vy;
  }
  void change_size(char kk) {
    if (kk == 'o') d += 5;
    else if (kk == 'k') d -= 5;
  }
  void change_speed(char kk) {
    if (kk == 'n') s += 0.5;
    else if (kk == 'm') s -= 0.5;
  }
}
