void drawzzanggu(float x, float y, float d , float ob_c){
  //face
  if (ob_c == 1) fill(255,229,204);
  else if (ob_c == 2) fill(255,0,0);
  else if (ob_c == 3) fill(0,255,255);
  noStroke();
  ellipse(x,y,350*d,300*d);
  arc(x,y+50*d,415*d,201*d,PI/2,3*PI/2);
  //mouth
  fill(190,0,0);
  stroke(0);
  circle(x-80*d,y+100*d,50*d);
  //hair
  fill(0);
  arc(x,y-100*d,255*d,100*d,PI,2*PI);
  arc(x+125*d,y,90*d,200*d,3*PI/2,5*PI/2);
  //eye
  beginShape();
  vertex(x-150*d,y-50*d);
  bezierVertex(x-120*d,y-100*d,x-90*d,y-100*d,x-60*d,y-50*d);
  bezierVertex(x-90*d,y-75*d,x-120*d,y-75*d,x-150*d,y-50*d);
  endShape();
  beginShape();
  vertex(x,y-50*d);
  bezierVertex(x+30*d,y-100*d,x+60*d,y-100*d,x+90*d,y-50*d);
  bezierVertex(x+60*d,y-75*d,x+30*d,y-75*d,x,y-50*d);
  endShape();
  fill(255,229,204);
  arc(x-105*d,y-30*d,90*d,50*d,PI,2*PI);
  arc(x+45*d,y-30*d,90*d,50*d,PI,2*PI);
  fill(0);
  circle(x-90*d,y-10*d,60*d);
  circle(x+35*d,y-10*d,60*d);
  fill(255);
  circle(x-90*d,y-10*d,20*d);
  circle(x+35*d,y-10*d,20*d);
  //ear
  fill(255,229,204);
  noStroke();
  ellipse(x+150*d,y+80*d,70*d,50*d);
}
