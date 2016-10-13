import themidibus.*;
MidiBus bus;

PShader liveshader;

String shader_file = "template.glsl";

float[] midi_slider_values = new float[5];
int[] midi_slider_numbers = new int[5];
String[] midi_uniforms = new String[5];
float[] note = new float[2];

void setup() {
  size(1280, 720, P2D);
  noStroke();
  
  // Show devices, initialize bus
  MidiBus.list();
  bus = new MidiBus(this, 1, 1); // Change the device according to list
  
  // Initialize uniform names
  for(int i = 0; i < 5; i++) {
    midi_slider_values[i] = 0.0;
    midi_uniforms[i] = "midi" + i;
  }
  
  // Define midi sliders
  midi_slider_numbers[0] = 16;
  midi_slider_numbers[1] = 17;
  midi_slider_numbers[2] = 18;
  midi_slider_numbers[3] = 19;
  midi_slider_numbers[4] = 20;
  
  // Initialize note
  note[0] = 0.0; // pitch
  note[1] = 0.0; // value
  
  // Load shader
  liveshader = loadShader(shader_file);
  liveshader.set("resolution", float(width), float(height));
  initMidiUniforms();
}

void draw() {
  // Set uniforms
  liveshader.set("time", millis() / 1000.0);
  // Midi sliders
  for(int i = 0; i < 5; i++) {
    liveshader.set(midi_uniforms[i], midi_slider_values[i]);
  }
  // Note
  liveshader.set("note", note[0], note[1]);
  
  // draw shader
  shader(liveshader);
  rect(0, 0, width, height); 
}

//MIDI INPUT
//TODO: create envelope when pushing note
//-------------------------------------------
void noteOn(int channel, int pitch, int velocity) {
  //DEBUG PRINT
  //printMidiInfo("noteOn", channel, pitch, velocity);
  
  note[0] = (float)pitch/127.0;
  note[1] = (float)velocity/127.0;
}

void noteOff(int channel, int pitch, int velocity) {
  //DEBUG PRINT
  //printMidiInfo("noteOff", channel, pitch, velocity);
  
  note[0] = (float)pitch/127.0;
  note[1] = 0.0;
}

void controllerChange(int channel, int number, int value) {
  //DEBUG PRINT
  //printMidiInfo("controller", channel, number, value);
  
  for(int i = 0; i < 5; i++) {
    if(number == midi_slider_numbers[i]) {
      midi_slider_values[i] = (float)value/127.0;
    }
  }
}
//-------------------------------------------

//KEYBOARD INPUT
void keyPressed() {
  // RELOAD SHADER
  if(keyCode == ENTER) {
    liveshader = loadShader(shader_file);
    liveshader.set("resolution", float(width), float(height));
    initMidiUniforms();
    println("reload shader");
  }
}

void initMidiUniforms() {
  for(int i = 0; i < 5; i++) {
    liveshader.set(midi_uniforms[i], midi_slider_values[i]);
  }
}

void printMidiInfo(String event, int channel, int number, int value) {
  println();
  println(event);
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
}