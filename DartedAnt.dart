#import('dart:html');
#source('Ant.dart');
#source('Board.dart');
#source('Starter.dart');  
#source('Messages.dart');
#source('Messages.dart');

class DartedAnt {

  DartedAnt() {
    
  }

  createAnts(nbOfAnts, Board board){
    List<Ant> antList = new List();
    for(int i =0; i<nbOfAnts; i++){
      Ant ant = new Ant();
      ant.board = board;
      antList.add(ant);
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
    b.spawn().then((boardPort){
      var ants = createAnts(10,b);
      ants.forEach(  (ant) {
        ant.spawn().then((antPort){
          antPort.send(Message.sniff("nothing"),boardPort);  
      }); 
      });  
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
