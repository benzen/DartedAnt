#import('dart:html');
#source('Ant.dart');
#source('Board.dart');
#source('Launcher.dart');
#source('Starter.dart');

class DartedAnt {

  DartedAnt() {
  }

  void run() {
    write("Hello World!");
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new DartedAnt().run();
}
