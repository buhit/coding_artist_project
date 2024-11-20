// 게임의 전반적인 상태를 관리하고, 게임 시작, 종료, 타겟과 총알 업데이트 등 주요 로직을 처리하는 클래스.

/* 제공하는 함수
 update(): 게임 상태를 갱신하여, 타겟과 총알을 업데이트하고 플레이어 움직임을 처리한다.
 display(): 게임 화면을 렌더링하여 현재 상태를 시각적으로 보여준다.
 startGame(int n): 게임을 시작하고, 지정된 수만큼 타겟을 생성한다.
 resetGame(): 게임을 초기 상태로 재설정한다.
 handleKeyPress(): 키보드 입력을 처리하여 타겟 수 입력과 게임 재시작 등을 제어한다.
 handleMousePress(): 마우스 클릭 시 플레이어가 총알을 발사하도록 한다.
 updateTargets(): 타겟을 이동시키고, 총알과의 충돌 여부를 확인하여 충돌 시 타겟의 수명을 감소한다. 수명이 0이 되면 타겟을 제거한다.
 updateBullets(): 총알을 이동시키고, 화면 밖으로 나간 총알을 제거한다.
 checkGameEnd(): 모든 타겟을 제거하면 게임 종료 상태로 전환한다.
 displayInputPrompt(): 게임 시작 전 타겟 수를 입력하도록 안내 메시지를 화면에 표시한다.
 displayEndMessage(): 게임 종료 시 클리어 타임과 재시작 안내 메시지를 표시한다.
 displayGameElements(): 플레이어, 타겟, 총알을 화면에 그린다.
 */

class Game {
  Player player;
  ArrayList<Bullet> bullets;
  ArrayList<Target> targets;
  int targetCount = 10;
  boolean gameRunning = false;
  int startTime;
  float clearTime = 0;
  String targetInput = "";
  boolean inputMode = true;

  Game() {
    player = new Player(width / 2, height - 50);
    bullets = new ArrayList<Bullet>();
    targets = new ArrayList<Target>();
  }

  void update() {
    if (inputMode) return;

    if (gameRunning) {
      updateTargets();
      updateBullets();
      player.move();
      checkGameEnd();
    }
  }

  void display() {
    if (inputMode) {
      displayInputPrompt();
    } else if (!gameRunning) {
      displayEndMessage();
    } else {
      displayGameElements();
    }
  }


  void startGame(int n) {
    targets.clear();
    bullets.clear();
    clearTime = 0;

    float radius = 100.0 / n;
    for (int i = 0; i < n; i++) {
      int type = int(random(3)); // 0, 1, 2 중 하나 선택
      if (type == 0) {
        targets.add(new Target_Pink(random(width), random(height - 100), radius));
      } else if (type == 1) {
        targets.add(new Target_Skyblue(random(width), random(height - 100), radius));
      } else if (type == 2) {
        targets.add(new Target_Yellow(random(width), random(height - 100), radius));
      }
    }

    startTime = millis();
    gameRunning = true;
  }


  void resetGame() {
    gameRunning = false;
    inputMode = true;
    targetInput = "";
    player = new Player(width / 2, height - 30);
    bullets = new ArrayList<Bullet>();
    targets = new ArrayList<Target>();
  }

  void handleKeyPress() {
    if (inputMode) {
      if (key >= '0' && key <= '9') {
        targetInput += key;
      } else if (key == BACKSPACE && targetInput.length() > 0) {
        targetInput = targetInput.substring(0, targetInput.length() - 1);
      } else if (key == ENTER) {
        targetCount = int(targetInput);
        inputMode = false;
        startGame(targetCount);
      }
    } else if (key == 'r') {
      resetGame();
    }
  }

  void handleMousePress() {
    if (!inputMode) {
      player.shoot(bullets);
    }
  }

  void updateTargets() {
    for (int i = targets.size() - 1; i >= 0; i--) {
      Target target = targets.get(i);
      target.move();
      for (int j = bullets.size() - 1; j >= 0; j--) {
        Bullet bullet = bullets.get(j);
        if (target.checkCollision(bullet)) {
          bullets.remove(j); // 총알 제거
          target.hitCount--; // 남은 맞춤 횟수 감소
          if (target.hitCount <= 0) {
            targets.remove(i); // 타겟 제거
          }
          break;
        }
      }
    }
  }


  void updateBullets() {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet bullet = bullets.get(i);
      bullet.update();
      if (bullet.offScreen()) {
        bullets.remove(i);
      }
    }
  }

  void checkGameEnd() {
    if (targets.size() == 0) {
      gameRunning = false;
      clearTime = millis() - startTime;
    }
  }

  void displayInputPrompt() {
    textAlign(CENTER);
    fill(0);
    textSize(20);
    text("Enter number of targets:", width / 2, height / 2 - 20);
    text(targetInput, width / 2, height / 2);
  }

  void displayEndMessage() {
    textAlign(CENTER);
    fill(0);
    textSize(20);
    if (clearTime > 0) {
      text("You won! Time: " + nf(clearTime / 1000.0, 0, 2) + " seconds", width / 2, height / 2);
      text("Press 'r' to restart", width / 2, height / 2 + 30);
    } else {
      text("Press Enter to start", width / 2, height / 2);
    }
  }

  void displayGameElements() {
    for (Target target : targets) {
      target.display();
    }
    for (Bullet bullet : bullets) {
      bullet.display();
    }
    player.display();
  }
}
