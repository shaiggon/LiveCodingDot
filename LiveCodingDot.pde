import themidibus.*;
MidiBus bus;

PShader liveshader;

String shader_file = "template.glsl";

boolean midi_ctrl_change = false;

void setup() {
  size(1280, 720, P2D);
  noStroke();
  
  // Show devices, initialize bus
  MidiBus.list();
  bus = new MidiBus(this, 1, 1);
  
  liveshader = loadShader(shader_file);
  liveshader.set("resolution", float(width), float(height)); 
}

void draw() {
  //set uniforms
  liveshader.set("time", millis() / 1000.0);
  
  //draw shader
  shader(liveshader);
  rect(0, 0, width, height); 
}


//MIDI INPUT
//-------------------------------------------
void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
}
//-------------------------------------------

//KEYBOARD INPUT
void keyPressed() {
  // RELOAD SHADER
  if(keyCode == ENTER) {
    liveshader = loadShader(shader_file);
    liveshader.set("resolution", float(width), float(height)); 
    println("reload shader");
  }
}