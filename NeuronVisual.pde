/*
class NeuronVisual{
  float x_pos;
  float y_pos;
  float size;
  int inputs;
  int outputs = 1;
  Neuron n;
  
  
  public NeuronVisual(float x_pos, float y_pos, float size, int inputs, int outputs, Neuron n){
    this.x_pos = x_pos;
    this.y_pos = y_pos;
    this.size = size;
    this.inputs = inputs;
    this.outputs = outputs;
    this.n = n;
  }
  public NeuronVisual(float x_pos, float y_pos, float size, int inputs, Neuron n){
    this.x_pos = x_pos;
    this.y_pos = y_pos;
    this.size = size;
    this.inputs = inputs;
    this.n = n;
  }
  
  void drawNeuron(){
    info.stroke(255);
    info.ellipse(x_pos, y_pos, size, size);
    info.strokeWeight(4);
    info.line(x_pos, y_pos, x_pos + size, y_pos);
    info.line(x_pos, y_pos, x_pos - size, y_pos + size / 2);
    info.line(x_pos, y_pos, x_pos - size, y_pos - size / 2);
    
    
  }
  
  void fire(){
    scale(1,-1);
    info.text("a" ,x_pos + size, y_pos);
    scale(1,-1);
  }
  
  void compute(){
    
  }
  
}
*/
