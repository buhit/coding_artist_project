// 2024 2학기 코딩하는 아티스트 1조 HW10

// 구현한 게임 : 타겟 슈팅 게임

/* 기능 설명
01. 화면의 사이즈는 (800,600)
02. 게임을 시작하면 원하는 타겟의 수를 입력할 수 있다. 이 타겟들은 벽과 튕기면서 움직인다.
03. 타겟의 수가 많을수록 이 타겟들의 크기는 작아진다.
04. 타겟의 수를 입력하면 본격적으로 게임을 시작한다. 그럼 n개의 타겟이 화면에서 랜덤한 위치에서 spawn이 되고 움직인다. 
05. 이 타겟들이 움직이는 속도인 vx와 vy도 일정하지 않고 랜덤하지만 절대 속도는 크기에 비례한다. 타겟이 작을 수록 느리게 움직인다.
06. player는 화면 하단 부분에서 키보드로 a,d를 눌러서 좌우로 움직일 수 있다.
07. player는 그리고 총알을 쏠 수 있다. 한 화면에 최대 5개까지만 존재 할 수 있고, 총을 쏘는 데는 시간 간격이 있다.
08. player는 화면속에 마우스를 클릭하면 그 지점 방향으로 총알을 발사한다.
09. 돌아다니는 타겟은 총알과 맞으면 타겟과 총알이 동시에 사라진다.
10. 모든 타겟을 다 맞추면 게임은 종료되고, 총 걸리는 시간이 표시된다.
11. 게임이 종료되야 다시 시작할 수 있고, 다시 시작하려면 'r' 키를 눌러야한다.
*/

Game game;

void setup() {
  size(800, 600);
  game = new Game();
}

void draw() {
  background(255);
  game.update();
  game.display();
}

// 키 입력 처리
void keyPressed() {
  game.handleKeyPress();
}

// 마우스 클릭으로 총알 발사
void mousePressed() {
  game.handleMousePress();
}