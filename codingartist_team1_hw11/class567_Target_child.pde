// 타겟 클래스를 상속한 3개의 다른 자식 타겟 클래스 - 눈 색깔에 차이를 주었다.
// 핑크색 눈 타겟 클래스는 수명이 1개
// 하늘색 눈 타겟 클래스는 수명이 2개
// 노랑색 눈 타겟 클래스는 수명이 3개

class Target_Pink extends Target {
  Target_Pink(float x, float y, float radius) {
    super(x, y, radius, 1); // 1번 맞춰야 함
  }

  void display() {
    super.display();
    fill(255,0,255); //핑크색 눈
    circle(x-4.5*d, y-2.5*d, 4*d);//눈1
    circle(x+4.5*d, y-2.5*d, 4*d);//눈2
  }
}

class Target_Skyblue extends Target {
  Target_Skyblue(float x, float y, float radius) {
    super(x, y, radius, 2); // 2번 맞춰야 함
  }

  void display() {
    super.display();
    fill(0,255,255); //하늘색 눈
    circle(x-4.5*d, y-2.5*d, 4*d);//눈1
    circle(x+4.5*d, y-2.5*d, 4*d);//눈2
  }
}

class Target_Yellow extends Target {
  Target_Yellow(float x, float y, float radius) {
    super(x, y, radius, 3); // 3번 맞춰야 함
  }

  void display() {
    super.display();
    fill(255,255,0); //노랑색 눈
    circle(x-4.5*d, y-2.5*d, 4*d);//눈1
    circle(x+4.5*d, y-2.5*d, 4*d);//눈2
  }
}
