class Neuron{
  float value;
  float weights[];
  
  public Neuron(int numOfInputs){
    //+1 for bias weight
    weights = new float[numOfInputs + 1];
    for(int i = 0; i < numOfInputs; i++){
      weights[i] = random(-1,1);
    }
    weights[weights.length - 1] = 1;
  }
  
  public void compute(float[] inputs){
    value = 0;
    for(int i = 0; i < inputs.length; i++){
      value += inputs[i] * weights[i];
    }
    value += weights[weights.length - 1];
  }
  
  public void train(float[]inputs, float correct){
    float error = correct - fire();
    
    for(int i = 0; i < inputs.length; i++){
      weights[i] += error * inputs[i] * trainingStep;
    }
    weights[weights.length - 1] += error * trainingStep * bias_value; 
  }
  
  public void randomizeWeights(){
    for(int i = 0; i < weights.length; i++){
      weights[i] = random(-1,1);
    }
  }
  
  public float fire(){
    return value/Math.abs(value);
  }
}
