// 2024 2학기 코딩하는 아티스트 1조 HW9

// 3개의 캐릭터를 클래스 형태로 바꿔서 서로 다른 움직임을 보여준다.
// character 1 : w a s d 키로 조작 |  i j 키로 사이즈 조절 가능
// character 2 : 벽에 튕김         |  o k 키로 사이즈 조절 가능  |   n m 키로 속도 조절 가능
// character 3 : 마우스를 따라감   |  p l 키로 사이즈 조절 가능  |   c 키로 색깔 조절 가능

char1 c1;
char2 c2;
char3 c3;

void setup() {
  size(1000, 600);
  // initialize variables
  c1 = new char1();
  c2 = new char2();
  c3 = new char3();
}
void draw() {
  background(0, 255, 255);
  show_rule();
  c1.show();
  c2.move();
  c2.show();
  c3.move();
  c3.show();
}
void keyPressed() {
  c1.change_size(key);
  c2.change_size(key);
  c3.change_size(key);

  c1.move(key);
  c2.change_speed(key);
  c3.change_color(key);
}
