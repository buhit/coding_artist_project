// 플레이어 캐릭터를 제어하는 클래스. a와 d 키로 이동하고, 마우스를 클릭하면 총알을 발사한다.
// 이종호 캐릭터 사용

/* 제공하는 함수
move(): a와 d 키로 플레이어를 좌우로 이동시킵니다.
shoot(ArrayList<Bullet> bullets): 마우스 클릭 시 일정 시간 간격을 두고 총알을 발사합니다.
display(): 플레이어의 위치에 이종호 캐릭터 디자인으로 플레이어를 그립니다.
*/

class Player {
  float x, y;
  float d = 0.4;
  int maxBullets = 5;
  int shotDelay = 300;
  int lastShotTime = 0;

  Player(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void move() {
    if (keyPressed) {
      if (key == 'a') x -= 5;
      if (key == 'd') x += 5;
    }
    x = constrain(x, 0, width);
  }

  void shoot(ArrayList<Bullet> bullets) {
    int currentTime = millis();
    if (mousePressed && bullets.size() < maxBullets && currentTime - lastShotTime > shotDelay) {
      bullets.add(new Bullet(x, y, mouseX, mouseY));
      lastShotTime = currentTime;
    }
  }

  void display() {
    fill(255);
    // rect(x, y, 20, 20);
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
}
