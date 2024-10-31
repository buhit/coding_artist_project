void show_rule() {
  fill(0);
  textSize(12);
  textAlign(RIGHT);
  
  // Character 1 조작
  text("Character 1 (WASD to move, I/J to change size)", width - 10, 20);
  
  // Character 2 조작
  text("Character 2 (Bounces on walls, O/K to change size, N/M to change speed)", width - 10, 40);
  
  // Character 3 조작
  text("Character 3 (Follows mouse, P/L to change size, C to change color)", width - 10, 60);
}
