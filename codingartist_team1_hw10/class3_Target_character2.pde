// 맞춰야 하는 타겟을 나타내는 클래스. 벽에 부딪힐 때 반사하며 이동하고, 총알과의 충돌을 체크하여 맞았을 때 삭제된다.
// 정웅재 캐릭터 사용

/* 제공하는 함수 
move(): 타겟을 이동시키고, 화면 가장자리에 닿으면 반사한다.
display(): 타겟을 화면에 정웅재 캐릭터 디자인으로 그린다.
checkCollision(Bullet bullet): 타겟과 총알의 충돌 여부를 확인하여, 충돌 시 타겟을 제거할 수 있도록 한다.
*/


class Target {
  float x, y;
  float d;
  float vx, vy;
  float radius;

  Target(float x, float y, float radius, int n) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    
    float speedFactor = 10 / sqrt(n); 
    float angle = random(TWO_PI);
    vx = cos(angle) * speedFactor;
    vy = sin(angle) * speedFactor;
  }

  void move() {
    x += vx;
    y += vy;
    if (x < radius || x > width - radius) vx *= -1;
    if (y < radius || y > height - radius) vy *= -1;
  }

  void display() {
    fill(0, 255, 0);
    //ellipse(x, y, radius * 2, radius * 2);
    d = radius/4;
    stroke(0);
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

  boolean checkCollision(Bullet bullet) {
    float distSq = sq(x - bullet.x) + sq(y - bullet.y);
    return distSq <= sq(radius)*2;
  }
}
