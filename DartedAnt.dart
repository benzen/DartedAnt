#import('dart:html');
#source('Ant.dart');
#source('Board.dart');
#source('Starter.dart');

class DartedAnt {

  DartedAnt() {
    
  }

  createAnts(nbOfAnts, Board board){
    List<Ant> antList = new List();
    for(int i =0; i<nbOfAnts; i++){
      antList.add(new Ant(board));
    }  
    return antList;
  }

  void run() {
    write("Hello World!");
    new Starter().spawn().then((port){
      ['Hello', 'from', 'other', 'isolate'].forEach(f(message) => port.send(message));
      port.send(null);
    });
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new DartedAnt().run();
}
