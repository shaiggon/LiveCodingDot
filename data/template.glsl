#define PROCESSING_COLOR_SHADER

uniform vec2 resolution;
uniform float time;
uniform float midi0;
uniform float midi1;
uniform float midi2;
uniform float midi3;
uniform float midi4;
uniform vec2 note;

void main(void) {
  vec2 p = -1.0 + 2.0 * gl_FragCoord.xy / resolution.xy;
  
  float dist = 0.5 + 0.5*sin(time);
  float beat = note.y;
  gl_FragColor=vec4(p.x * beat, p.y * dist, midi0, 1.0);
}
