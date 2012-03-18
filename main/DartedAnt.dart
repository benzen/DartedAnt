class DartedAnt {

  createAnts(nbOfAnts){
    var antList = [];
    for(int i =0; i<nbOfAnts; i++){
      Ant ant = new Ant();
      antList.push(ant);
    }
    return antList;
  }

  void run() {
    Board b = new Board();
    b.spawn().then((SendPort boardPort){
      var ants = createAnts(Config.nbAnts);
      ants.forEach(  (ant) {
        ant.spawn().then( (SendPort antPort){
          antPort.send(new Message.sniff("nothing"), boardPort);

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



