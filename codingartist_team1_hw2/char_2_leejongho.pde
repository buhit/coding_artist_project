// 이종호 캐릭터 : 돼지
// 머리 중심 좌표랑 크기 비율을 입력하면 돼지 전체를 다 그려주는 함수를 만들었다.
// 기존 hw1에서 void setup 함수는 없애고 아예 drawPig 함수만 남겨뒀다.

// x와 y와 scale를 입력 받으면 돼지를 그리는 함수를 여기다가 선언
void drawPig(float head_x, float head_y, float scale) {
  
  // Scale 크기 비율
  float d = scale;
  
  // Body 좌표
  float body_x = head_x + 50*d;
  float body_y = head_y + 50*d;
  
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
  circle(head_x, head_y, 100*d); // 머리

  // 귀 
  fill(255, 204, 204); // 더 밝은 핑크색
  stroke(200, 100, 150);
  strokeWeight(3);
  
  pushMatrix(); 
  translate(head_x - 35*d, head_y - 30*d); // 왼쪽 귀 위치로 이동
  rotate(radians(40)); // 왼쪽 귀 회전
  ellipse(0, 0, 30*d, 50*d); // 왼쪽 귀
  popMatrix(); 

  pushMatrix(); 
  translate(head_x + 35*d, head_y - 30*d); // 오른쪽 귀 위치로 이동
  rotate(radians(-40)); // 오른쪽 귀 회전
  ellipse(0, 0, 30*d, 50*d); // 오른쪽 귀
  popMatrix(); 
  
  // 입
  fill(255, 0, 0); // 빨간색
  stroke(200, 0, 0); // 붉은 빨강
  ellipse(head_x, head_y + 30*d, 10*d, 15*d); // 타원형 입
  
  // 코 
  fill(255, 160, 180);
  stroke(200, 100, 150);
  strokeWeight(3);
  ellipse(head_x, head_y + 15*d, 40*d, 25*d); // 코 기본 타원
  fill(0);
  noStroke();
  ellipse(head_x - 10*d, head_y + 15*d, 10*d, 15*d); // 왼쪽 코 구멍
  ellipse(head_x + 10*d, head_y + 15*d, 10*d, 15*d); // 오른쪽 코 구멍

  // 눈 
  fill(0);
  circle(head_x - 18*d, head_y - 15*d, 10*d); // 왼쪽 눈
  circle(head_x + 18*d, head_y - 15*d, 10*d); // 오른쪽 눈

  // 좌반신 다리 
  fill(255, 182, 193);
  stroke(200, 100, 150);
  strokeWeight(3);
  rect(body_x - 18*d, body_y + 17*d, 20*d, 40*d, 10*d); // 좌반신 앞 다리
  rect(body_x + 22*d, body_y + 17*d, 20*d, 40*d, 10*d); // 좌반신 뒤 다리
}
