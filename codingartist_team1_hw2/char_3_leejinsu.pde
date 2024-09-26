// 함수 선언하는 탭입니다.


void awesome_face(float x, float y, float d){
  
  stroke(0);
  strokeWeight(3*d);
  fill(254,223,87);
  circle(x,y,100*d); // face
  
  fill(255);
  arc(x-27.5*d,y-5*d,25*d,40*d,PI,2*PI);
  line(x-40*d,y-5*d,x-15*d,y-5*d); // left eye
  
  arc(x+17.5*d,y-5*d,25*d,40*d,PI,2*PI);
  line(x+5*d,y-5*d,x+30*d,y-5*d); // right eye
  
  fill(0);
  circle(x-22*d,y-17*d,9*d); // left pupil
  
  circle(x+23*d,y-17*d,9*d); // right pupil
  
  fill(136,18,67);
  arc(x-2.5*d,y+5*d,65*d,65*d,0,PI);
  line(x-40*d,y+5*d,x+30*d,y+5*d); // mouth
  
  fill(249,191,222);
  strokeWeight(0);
  pushMatrix();
  translate(x+5*d,y+30*d);
  rotate(-PI/12);
  ellipse(0,0,27*d,15*d);
  popMatrix(); // tongue
  
  strokeWeight(3*d);
  noFill();
  arc(x-2.5*d,y+5*d,65*d,65*d,0,PI); // mouth outline
}
