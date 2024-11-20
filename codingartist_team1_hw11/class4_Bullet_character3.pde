// 플레이어가 발사하는 총알을 나타내는 클래스. 목표 지점을 향해 이동하며, 화면 밖으로 나가면 삭제된다.
// 석도준 캐릭터 사용

/* 제공하는 함수 
update(): 총알을 목표 방향으로 이동시킨다.
display(): 총알을 화면에 석도준 캐릭터 모양으로 그린다.
offScreen(): 총알이 화면 밖으로 나갔는지 여부를 확인하여, 나갔으면 제거할 수 있도록 한다.
*/

class Bullet {
  float x, y;
  float d = 4;
  float dx, dy;

  Bullet(float x, float y, float targetX, float targetY) {
    this.x = x;
    this.y = y;
    float angle = atan2(targetY - y, targetX - x);
    dx = cos(angle) * 10;
    dy = sin(angle) * 10;
  }

  void update() {
    x += dx;
    y += dy;
  }

  void display() {
    fill(255);
    // Sellipse(x, y, 5, 5);
    stroke(0);
    circle(x-5*d, y-0.5*d, 2*d);
    circle(x+5*d, y-d, 2*d);
    circle(x, y, 10*d);
    circle(x-2*d, y-d, 3*d);
    circle(x+2*d, y-d, 3*d);
    arc(x, y+2*d, 3*d, 3*d, 0, PI);
  }

  boolean offScreen() {
    return x < 0 || x > width || y < 0 || y > height;
  }
}
