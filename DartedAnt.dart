#import('dart:html');
#source('Ant.dart');
#source('Board.dart');
#source('Starter.dart');
#source('PositionMessage.dart');  
#source('SniffMessage.dart');

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
//
//    new Starter().spawn().then((port){
//      ['Hello', 'from', 'other', 'isolate'].forEach(f(message) => port.send(message));
//      port.send(null);
//    });
    Board b = new Board();
    b.spawn();
    var ants = createAnts(10,b);
    ants.forEach( f(Ant ant) => ant.spawn() );
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new DartedAnt().run();
}
