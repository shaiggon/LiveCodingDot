#LiveCodingDot
LiveCodingDot is a very stripped down live graphics coding template for processing. It is meant to be used at some [DOT's](http://dot.ayy.fi/) events. The project allows users to code shaders, reload them on the fly and use midi inputs for extra fun times.

##Installation
LiveCodingDot requires [MidiBus](https://github.com/sparks/themidibus) for midi input handling. It also requires [Processing](https://processing.org).

To install, just download the project to your Processing sketchbook.

##Usage
Run LiveCodingDot in Processing. To reload shader press Enter. Use any text editor to edit the shader. To create a new shader, create a new shader in data/ folder and set the global variable shader\_file to the name of the shader file in data/ folder.
You can change the midi device when initializing bus.
