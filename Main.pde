int numberOfPoints = 100; //<>//
float x_0 = 400;
float y_0 = 10;
float slope = -10;
float trainingStep = 0.2;
int correct = 0;
int learningItterations = 0;
float bias_value = 100;
//ChildApplet info;

float neuronSlope = 0;
float neuron_y = 0;

Neuron n1 = new Neuron(2);

PVector[] points = new PVector[numberOfPoints];
int[] points_classification = new int[numberOfPoints];

boolean paused = true;
boolean canRandomize = false;
int delay = 0;

//writing stats
int statsCntr = 0;
float percentageCorrect = correct/(float)numberOfPoints * 100;
float w_0 = n1.weights[0];
float w_1 = n1.weights[1];
float w_2 = n1.weights[2];
float learningItterationsStats = learningItterations;
int refreshRate = 50;

public void settings(){
  smooth(2);
  size(1000, 1000);
  
}

public void setup(){
  background(255);
  frameRate(60);
  for(int i = 0; i < numberOfPoints; i++){
    points[i] = new PVector(random(-width/2, width/2), random(-height/2, height/2));
    if(points[i].y < getYLineValue(points[i].x)){
      points_classification[i] = -1;
    }else{
      points_classification[i] = 1;
    }
  }
  //info = new ChildApplet();
}

public void draw(){
  background(255);
  translate(width/2, height/2);
  scale(1,-1);
  //visualizing neuron learning
  stroke(230,0,0,255);
  neuron_y = (-n1.weights[2]-n1.weights[0] * 20)/(n1.weights[1]);
  neuronSlope = -n1.weights[0]/n1.weights[1];
  drawLine(20, neuron_y, neuronSlope);
  strokeWeight(1);
  stroke(0);
  correct = 0;
  
  drawLine(x_0,y_0,slope);
  
  for(int i = 0; i < numberOfPoints; i++){
    if(points_classification[i] == 1){
      fill(0);
    }else{
      fill(150);
    }
    ellipse(points[i].x, points[i].y, 10, 10);
  }
  
  for(int i = 0; i < numberOfPoints; i++){
    n1.compute(new float[]{points[i].x, points[i].y});
    
    if(n1.fire() == points_classification[i]){
      correct++;
      stroke(0, 0);
      fill(255,50,50,250);
      ellipse(points[i].x, points[i].y, 5, 5);
    
    }else{
      n1.train(new float[]{points[i].x, points[i].y}, points_classification[i]);
      learningItterations++;
    }
    
  }
  
  
   //<>//
  stroke(0, 0);
  fill(255, 200);
  rect(-width/2, height/2, 400, -50);
  scale(1,-1);
  fill(0);
  if(statsCntr == refreshRate - 1){
    percentageCorrect = correct/(float)numberOfPoints * 100;
    w_0 = n1.weights[0];
    w_1 = n1.weights[1];
    w_2 = n1.weights[2];
    learningItterationsStats = learningItterations;
  }
  
  
  text("correct guesses: " + percentageCorrect + "%",-width/2 + 10,-height/2 + 10);
  text("w_0: " + w_0,-width/2 + 10,-height/2 + 20);
  text("w_1: " + w_1,-width/2 + 110,-height/2 + 20);
  text("bias: " + w_2,-width/2 + 210,-height/2 + 20);
  text("learningItterations: " + learningItterationsStats,-width/2 + 200,-height/2 + 10);
  text("bias_value: " + bias_value,-width/2 + 200,-height/2 + 30);
  scale(1,-1);
  fill(255);
  if(key == 'q'){
    randomizePoints();
    delay(500);
    key = '0';
  }
  delay(delay);
  
  //slowing down stats updates
  statsCntr++;
  statsCntr %= refreshRate;
}

public float getYLineValue(float x){
  return slope*(x - x_0) + y_0;
}

public void drawLine(float x_0, float y_0, float slope){
  float y1 = slope*(-width/2 - x_0)+y_0;
  float y2 = slope*(width/2 - x_0)+y_0;
  
  line(-width/2, y1, width/2, y2);
}

public void randomizePoints(){
  for(int i = 0; i < numberOfPoints; i++){
    points[i] = new PVector(random(-width/2, width/2), random(-height/2, height/2));
    if(points[i].y < getYLineValue(points[i].x)){
      points_classification[i] = -1;
    }else{
      points_classification[i] = 1;
    }
  }
}

public void keyPressed(){
  switch(key){
    case('r'):
    learningItterations = 0;
      n1.randomizeWeights();
    break;
    case('p'):
      if(paused == true){
      loop();
      paused = false;
    }else{
      noLoop();
      paused = true;
    }
    break;
    case('i'):
      delay += 100;
    break;
    case('u'):
      delay -= 100;
      if (delay < 0){
        delay = 0;
      }
    break;
    case('m'):
      bias_value += 10;
    break;
    case('n'):
      bias_value -= 10;
    break;
  }
}
/*
class ChildApplet extends PApplet {
  //JFrame frame;
  
  
  public ChildApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(400, 400);
    smooth();
  }
  public void setup() { 
    surface.setTitle("Info");
    
  }

  public void draw() {
    translate(width/2, height/2);
    scale(1,-1);
    background(0);
    n_v1.drawNeuron();
    
  }

  public void mousePressed() {
    
  }

  public void mouseDragged() {
    
  }
}
*/
