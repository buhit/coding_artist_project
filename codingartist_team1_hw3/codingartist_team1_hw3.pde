// 2024 2학기 코딩하는 아티스트 1조 HW3

// 조에서 상의하고 설정한 미션: 
// 1. HW1때 만든 3개의 캐릭터가 서로 튕기면서 장애물 역할을 한다.
// 2. 키보드로 캐릭터를 하나 조종해서, 장애물을 피하고, 시작점부터 끝점까지 도달하게 한다. [w, a, s, d] 사용 / [좌측 하단에서 우측 상단으로]
// 3. 키보드로 움직이는 캐릭터는 게임 중간중간 키보드를 눌러서 자유롭게 바꿀수 있게 한다. [ i, o, p] 키로 캐릭터 종류 바꿈
// 4. 시간 제한을 둔다. [20초]
// 5. 마우스를 클릭할때마다 배경색깔을 바꾸게한다.
// 6. 장애물들이 서로 부딪힐때마다 장애물 색깔이 바뀐다.
// 7. 게임도중에 조종하는 캐릭터가 장애물이랑 부딪히면 원래 시작 위치로 돌아온다.
// 8. 5번까지 기회를 준다. 장애물과 6번째 부딪히면 바로 게임 오버다.
// 9. 게임 성공 메세지와 실패 메세지를 표시한다.
//10. 게임 성공 시 소요시간 표시한다.

// 장애물 용도로 사용할 3개의 캐릭터들에 대한 변수들
// 3개의 장애물 위치
float ob1_x, ob1_y, ob2_x, ob2_y, ob3_x, ob3_y;
// 장애물 크기 비율
float ob1_d, ob2_d, ob3_d;
// 장애물 움직이는 속도;
float ob1_vx, ob1_vy, ob2_vx, ob2_vy, ob3_vx, ob3_vy;
// 장애물 얼굴 색깔 스위치용 변수
float ob1_c, ob2_c, ob3_c;

// 키보드로 움직일 캐릭터에 대한 변수
// 캐릭터 종류에 대한 변수
float ch_type;
// 캐릭터 위치 & 크기 비율
float ch_x, ch_y, ch_d;
// 캐릭터 시작 위치 
float st_x = 100, st_y = 400;

// 타이머용 변수
int frame, time, game_timer;
int start_frame;
float clear_time = 0;

// 배경 색 관련 변수
int bgcolor;
float bgstate;

// 장애물과 충돌횟수 
float colide_count;

// 게임 성공 여부 변수 : 0이면 도전중, 1이면 실패, 2면 성공,
float mission_state;

void setup(){
  size(1000,500);
  frameRate(60);
  
  //게임시작하면, 충돌 횟수 초기화 & 미션 본격적으로 도전 시작
  colide_count = 0;  mission_state = 0;
  
  // 시작 시간 기록
  start_frame = frame;
  
  // 장애물 초기 크기, 색깔 type, 위치, 속도 선정
  ob1_d = 0.4;   ob2_d = 0.7;   ob3_d = 1;
  ob1_c = 2;     ob2_c = 2;     ob3_c = 2;
  ob1_x = 100;   ob2_x = 400;   ob3_x = 700;
  ob1_y = 250;   ob2_y = 490;   ob3_y = 10;
  ob1_vx = 4;    ob2_vx = 5;    ob3_vx = 3;
  ob1_vy = 3;    ob2_vy = 1;    ob3_vy = 2;
  
  // 캐릭터 종류 타입 초기화
  ch_type = 1;
  // 캐릭터 시작 위치 지정
  ch_x = st_x; ch_y = st_y; 
  // 프레임 수 초기화
  frame = 0;
  // 초기 배경 색 지정
  bgcolor = #649bff;
  bgstate = 1;
  
}

void draw(){
  
  background(bgcolor);
  if(bgstate == 1) bgcolor = #649bff; // 파란색 (초기 상태)
  if(bgstate == 2) bgcolor = #8AFF64; // 초록색
  if(bgstate == 3) bgcolor = #FF646C; // 빨간색
  
  // 도착 지점 표시
  fill(255, 0, 0);
  rect(930, 0, 70, 70);
  textSize(25);
  fill(255);
  text("GOAL",936,42);
  
  Obstacles_Moving();
  Move_Character(ch_type);
  
  // 제한 시간 표시
  frame++;
  time = frame/60; // time은 1초에 1씩 증가
  game_timer = 20 - time; // game_timer는 20에서 시작하여 1초에 1씩 감소  
  fill(255);
  rect(20, 17, 198, 48);
  textSize(30);
  fill(0);
  text(game_timer + " seconds left", 25,50);  // 제한 시간: 20초
  
  // 시간이 초과되었을 시
  if(game_timer == 0) mission_state = 1; // 실패로 간주
  
  // 미션을 실패했을 시
  if(mission_state == 1){
  Gameover();
  noLoop();
  }
  
  // 미션을 성공했을 시
  if(mission_state == 2){
  GameSucceed();
  noLoop();
  }
  
}

void mouseClicked(){
  if(bgstate == 1) bgstate = 2;
  else if(bgstate == 2) bgstate = 3;
  else bgstate = 1;
}

void keyPressed(){
  // w, a, s, d 키로 캐릭터를 움직인다.
  if(key == 'a') ch_x -= 30;
  else if(key == 'd') ch_x += 30;
  else if(key == 'w') ch_y -= 30;
  else if(key == 's') ch_y += 30;
  
  // i, o, p 키로 캐릭터 종류를 바꿔준다.
  else if(key == 'i') ch_type = 1;
  else if(key == 'o') ch_type = 2;
  else if(key == 'p') ch_type = 3;

}

//// 메인 알고리즘
void Move_Character(float character_type){

  //// 미션을 진행중이라면
  if (mission_state == 0) {
    if (character_type == 1)  drawzzanggu(ch_x, ch_y, 0.3, 1); 
    else if (character_type == 2)  drawPig(ch_x, ch_y, 0.6, 1);
    else if (character_type == 3)  awesome_face(ch_x, ch_y, 0.8, 1);
  
    // 장애물과 충돌했다면, 다시 원래 위치로 돌아가게 한다.
    float dx_1 = ob1_x - ch_x;
    float dy_1 = ob1_y - ch_y;
    float dx_2 = ob2_x - ch_x;
    float dy_2 = ob2_y - ch_y;
    float dx_3 = ob3_x - ch_x;
    float dy_3 = ob3_y - ch_y;
  
    float d1 = sqrt(dx_1*dx_1 + dy_1*dy_1);
    float d2 = sqrt(dx_2*dx_2 + dy_2*dy_2);
    float d3 = sqrt(dx_3*dx_3 + dy_3*dy_3);
  
    if (d1 < 70 | d2 < 70 | d3 < 70){    
      ch_x = st_x; ch_y = st_y;    // 시작 위치로 돌아간다.
      colide_count += 1;
      if (mission_state == 0 && colide_count == 6) mission_state = 1;  // 일정 횟수 충돌했다면 미션 실패로 간주
    }
    
    // 목적지에 도달했다면, 미션 성공으로 간주
    if (ch_x > 930 && ch_y < 70){
      if (mission_state == 0)  mission_state = 2;
    }
  }
}


//// 장애물들이 움직인다
void Obstacles_Moving(){
  ob1_x += ob1_vx;  ob1_y += ob1_vy;
  ob2_x += ob2_vx;  ob2_y += ob2_vy;
  ob3_x += ob3_vx;  ob3_y += ob3_vy;
  if(ob1_x < 0 || ob1_x > width) ob1_vx = -ob1_vx;
  if(ob2_x < 0 || ob2_x > width) ob2_vx = -ob2_vx;
  if(ob3_x < 0 || ob3_x > width) ob3_vx = -ob3_vx;
  if(ob1_y < 0 || ob1_y > height) ob1_vy = -ob1_vy;
  if(ob2_y < 0 || ob2_y > height) ob2_vy = -ob2_vy;
  if(ob3_y < 0 || ob3_y > height) ob3_vy = -ob3_vy;
  Obstacles_Coliding();
  drawzzanggu(ob1_x,ob1_y,ob1_d, ob1_c);
  drawPig(ob2_x,ob2_y,ob2_d, ob2_c);
  awesome_face(ob3_x,ob3_y,ob3_d, ob3_c);
  
}

//// 장애물 끼리 충돌한다면 속도를 교환하고, 색깔을 바꾼다
void Obstacles_Coliding(){
  float dx_12 = ob1_x - ob2_x;
  float dy_12 = ob1_y - ob2_y;
  float dx_23 = ob2_x - ob3_x;
  float dy_23 = ob2_y - ob3_y;
  float dx_31 = ob3_x - ob1_x;
  float dy_31 = ob3_y - ob1_y;
  
  float d12 = sqrt(dx_12*dx_12 + dy_12*dy_12);
  float d23 = sqrt(dx_23*dx_23 + dy_23*dy_23);
  float d31 = sqrt(dx_31*dx_31 + dy_31*dy_31);
  
  if (d12 < 100){
    dx_12 = ob1_vx;    dy_12 = ob1_vy;
    ob1_vx = ob2_vx;   ob1_vy = ob2_vy;
    ob2_vx = dx_12;    ob2_vy = dy_12;
    
    // 충돌을 한다면 색깔 타입을 확인하고 바꿔준다.
    if (ob1_c == 2) ob1_c = 3;
    else if (ob1_c == 3) ob1_c = 2;    
    if (ob2_c == 2) ob2_c = 3;
    else if (ob2_c == 3) ob2_c = 2;  
  }
  
  if (d23 < 100){
    dx_23 = ob2_vx;    dy_23 = ob2_vy;
    ob2_vx = ob3_vx;   ob2_vy = ob3_vy;
    ob3_vx = dx_23;    ob3_vy = dy_23;
    
    // 충돌을 한다면 색깔 타입을 확인하고 바꿔준다.
    if (ob2_c == 2) ob2_c = 3;
    else if (ob2_c == 3) ob2_c = 2;    
    if (ob3_c == 3) ob3_c = 2;
    else if (ob3_c == 2) ob3_c = 3;  
  }
  
  if (d31 < 100){
    dx_31 = ob3_vx;    dy_31 = ob3_vy;
    ob3_vx = ob1_vx;   ob3_vy = ob1_vy;
    ob1_vx = dx_31;    ob1_vy = dy_31;
    
    // 충돌을 한다면 색깔 타입을 확인하고 바꿔준다.
    if (ob3_c == 3) ob3_c = 2;
    else if (ob3_c == 2) ob3_c = 3;    
    if (ob1_c == 3) ob1_c = 2;
    else if (ob1_c == 2) ob1_c = 3;  
  }  
}

void Gameover(){
  background(bgcolor);
  textSize(50);
  fill(255);
  text("GAME OVER", 373, 240);
}

void GameSucceed(){
  background(bgcolor);
  textSize(50);
  fill(255);
  text("GOAL", 440, 240);
  clear_time =(frame - start_frame) / 60.0;
  textSize(30);
  text("Time: "+ clear_time +"seconds", 380, 290);
}
