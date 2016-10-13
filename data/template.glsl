#define PROCESSING_COLOR_SHADER

uniform vec2 resolution;
uniform float time;

void main(void) {
  vec2 p = -1.0 + 2.0 * gl_FragCoord.xy / resolution.xy;
  
  gl_FragColor=vec4(p.x, p.y, 0.5+0.5*sin(time*10.0), 1.0);
}
