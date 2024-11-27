// 2024 2학기 코딩하는 아티스트 1조 HW12

/* 기능 설명
01. 게임은 3D 환경으로 전환되었으며, 화면의 사이즈는 (800,600, P3D)로 설정되었다.
02. 카메라 시점은 두 가지로 전환 가능하다:
    - Bird's Eye View: 위에서 내려다보는 시점.
    - FPS View: 파란 구 기준 시점으로, 시점을 좌우로 회전할 수 있다.
03. Bird's Eye View는 'b' 키를, FPS View는 'f' 키를 눌러 활성화할 수 있다.
04. 3개의 도형이 움직이며, 각각의 도형은 다음과 같은 움직임을 가진다:
    - 빨간 큐브: 'W', 'A', 'S', 'D' 키로 상하좌우 이동 가능.
    - 파란 구: 'I', 'K' 키로 상하 이동 가능.
    - 초록 공: 자동으로 상하 이동을 반복한다.
05. FPS 시점에서는 'J', 'L' 키로 구 기준 좌우 시점을 변경할 수 있다.
06. 자동으로 움직이는 초록 공은 Y축 -100에서 100 사이를 반복적으로 이동한다.
07. 3D 축(X, Y, Z)은 색상으로 표시되며, 디버깅과 시각적 도움을 제공한다.
*/

// 도형들의 위치
float cubeX = -100, cubeY = 0, cubeZ = 0;
float sphereX = 100, sphereY = 0, sphereZ = 0;
float ballX = 0, ballY = 0, ballZ = -100; // 새로운 공
boolean ballMovingUp = true; // 공의 상하 이동 방향

// 카메라 설정
char cameraType = 'b'; // 'b' for Bird's Eye, 'f' for FPS
float camX = 0, camY = 300, camZ = 500; // Bird's Eye 초기값
float lookX = 0, lookY = 0, lookZ = 0; // 초점
float fpsAngle = 0; // FPS에서 좌우 시점 회전 각도

void setup() {
  size(800, 600, P3D);
}

void draw() {
  background(200);
  lights(); // 조명 추가

  // 카메라 설정
  if (cameraType == 'b') {
    // Bird's Eye View
    camera(200, -400, 500, 0, 0, 0, 0, 1, 0);
  } else if (cameraType == 'f') {
    // FPS View (구 기준)
    float camLookX = sphereX + cos(radians(fpsAngle)) * 100;
    float camLookZ = sphereZ + sin(radians(fpsAngle)) * 100;
    camera(sphereX, sphereY + 20, sphereZ + 100, camLookX, sphereY, camLookZ, 0, 1, 0);
  }

  // X, Y, Z 축 표시 (디버깅 용도)
  axis();
  
  noStroke();
  // 큐브
  pushMatrix();
  translate(cubeX, cubeY, cubeZ);
  fill(255, 0, 0);
  box(50);
  popMatrix();

  // 구
  pushMatrix();
  translate(sphereX, sphereY, sphereZ);
  fill(0, 0, 255);
  sphere(40);
  popMatrix();

  // 자동 상하 이동 공
  pushMatrix();
  translate(ballX, ballY, ballZ);
  fill(0, 255, 0); // 초록색
  sphere(25);
  popMatrix();

  // 공 상하 이동 업데이트
  updateBallMovement();
}

// 축 표시 함수
void axis() {
  strokeWeight(2);
  stroke(255, 0, 0); line(0, 0, 0, 300, 0, 0); // X축 (빨강)
  stroke(0, 255, 0); line(0, 0, 0, 0, 300, 0); // Y축 (초록)
  stroke(0, 0, 255); line(0, 0, 0, 0, 0, 300); // Z축 (파랑)
}

// 자동 상하 이동 공 업데이트
void updateBallMovement() {
  if (ballMovingUp) {
    ballY += 2;
    if (ballY > 100) ballMovingUp = false;
  } else {
    ballY -= 2;
    if (ballY < -100) ballMovingUp = true;
  }
}

// 키보드 입력 처리
void keyPressed() {
  // 시점 전환
  if (key == 'b') cameraType = 'b'; // Bird's Eye View
  if (key == 'f') cameraType = 'f'; // FPS View

  // 큐브 이동
  if (key == 'w') cubeY -= 10;
  if (key == 's') cubeY += 10;
  if (key == 'a') cubeX -= 10;
  if (key == 'd') cubeX += 10;

  // 구 이동 (상하만 조절)
  if (key == 'i') sphereY -= 10;
  if (key == 'k') sphereY += 10;

  // FPS 좌우 시점 변경
  if (key == 'j') fpsAngle -= 5; // 좌회전
  if (key == 'l') fpsAngle += 5; // 우회전
}
