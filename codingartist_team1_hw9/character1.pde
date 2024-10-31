// 이종호 캐릭터 : 캐릭터 1
// show : 돼지를 그린다.
// move : 'w','a','s','d' 키를 누르면서 돼지를 움직인다.
// change_size : 'i','j' 키를 누르면 돼지의 사이즈를 키우거나 줄일 수 있다.

class char1 {
  // constructor
  char1() {
    x = width/2;
    y = height/2;
    d = 1;
  }
  // member data
  float x, y, d;
  // member function
  void show() {
    // Body 좌표
    float body_x = x + 50*d;
    float body_y = y + 50*d;

    // Tail 좌표
    float tail_x = body_x + 60*d;
    float tail_y = body_y - 10*d;

    // 테두리 설정
    stroke(200, 100, 150); // 보라색
    strokeWeight(3); // 테두리 두께

    // 꼬리
    noFill();
    stroke(255, 160, 180);
    strokeWeight(5);
    arc(tail_x, tail_y, 40*d, 40*d, PI/2, PI);

    // 우반신 다리
    fill(230, 150, 170); // 어두운 핑크색
    stroke(200, 100, 150);
    strokeWeight(3);
    rect(body_x - 45*d, body_y + 14*d, 20*d, 40*d, 10*d); // 우반신 앞 다리
    rect(body_x - 5*d, body_y + 14*d, 20*d, 40*d, 10*d); // 우반신 뒤 다리

    // 몸통
    fill(255, 182, 193);
    ellipse(body_x, body_y, 100*d, 80*d); // 몸통

    // 머리
    circle(x, y, 100*d); // 머리

    // 귀
    fill(255, 204, 204); // 더 밝은 핑크색
    stroke(200, 100, 150);
    strokeWeight(3);

    pushMatrix();
    translate(x - 35*d, y - 30*d); // 왼쪽 귀 위치로 이동
    rotate(radians(40)); // 왼쪽 귀 회전
    ellipse(0, 0, 30*d, 50*d); // 왼쪽 귀
    popMatrix();

    pushMatrix();
    translate(x + 35*d, y - 30*d); // 오른쪽 귀 위치로 이동
    rotate(radians(-40)); // 오른쪽 귀 회전
    ellipse(0, 0, 30*d, 50*d); // 오른쪽 귀
    popMatrix();

    // 입
    fill(255, 0, 0); // 빨간색
    stroke(200, 0, 0); // 붉은 빨강
    ellipse(x, y + 30*d, 10*d, 15*d); // 타원형 입

    // 코
    fill(255, 160, 180);
    stroke(200, 100, 150);
    strokeWeight(3);
    ellipse(x, y + 15*d, 40*d, 25*d); // 코 기본 타원
    fill(0);
    noStroke();
    ellipse(x - 10*d, y + 15*d, 10*d, 15*d); // 왼쪽 코 구멍
    ellipse(x + 10*d, y + 15*d, 10*d, 15*d); // 오른쪽 코 구멍

    // 눈
    fill(0);
    circle(x - 18*d, y - 15*d, 10*d); // 왼쪽 눈
    circle(x + 18*d, y - 15*d, 10*d); // 오른쪽 눈

    // 좌반신 다리
    fill(255, 182, 193);
    stroke(200, 100, 150);
    strokeWeight(3);
    rect(body_x - 18*d, body_y + 17*d, 20*d, 40*d, 10*d); // 좌반신 앞 다리
    rect(body_x + 22*d, body_y + 17*d, 20*d, 40*d, 10*d); // 좌반신 뒤 다리
  }
  void move(char kk) {
    if (kk == 'w') y -= 15;
    else if (kk == 'a') x -= 15;
    else if (kk == 's') y += 15;
    else if (kk == 'd') x += 15;
  }
  void change_size(char kk) {
    if (kk == 'i') d += 0.5;
    else if (kk == 'j') d -= 0.5;
  }
}
