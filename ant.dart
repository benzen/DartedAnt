class Ant extends Isolate {
  int x,y;
  Board board;
  Ant(Board board){
    this.board = board;
    this.x = 0;
    this.y = 0;
    this.stopwatch = new Stopwatch();
    this.startStopwatchWatching();
  }
  void startStopwatchWatching(){
    while(true){
      
    }
  }
  moveToRandomPosition(){
    num number = Math.random().toInt();
  }
  main() {
    this.port.receive(
      void _(var message, SendPort replyTo) {
        print ("Ant receives: ${message}");
        replyTo.send("Pong");
        this.port.close();
      }
    );
  }
}

class Board extends Isolate{

  Map<List<int>, int> cases = null;
  final int eatX = 10 ;
  final int eatY = 10 ;
  final int anthillX = 0;
  final int anthillY = 0;
  final int height = 10;
  final int widht  = 10;

  Board(){
    for(var i = 0; i<this.height;i++){  
      for(var j = 0; j<this.widht;j++){
        List<int> key = new List();
        key.add(i);
        key.add(j);
        this.cases[key]=0;
      }
      Ant ant = new Ant(this);
      ant.start();
    }
    
  }
  antMove(x,y){
    var key = new List();
    key.add(x);
    key.add(y);
    if( ( this.eatX == x) && ( this.eatY == y) ){
      int strengh = this.cases.remove(key);
      cases[key] = strengh+1;
      return "eat";
    } else if( ( this.anthillX == x) &&( this.anthillY == y) ){
      return "anthill";
    }else return "nothing";
  }

  main(){
    this.port.recieve(
      void _(List<int> position, SendPort replyTo){
        print("Board : ant move $position[0] $position[1]");
        String response = this.antMove(position[0],position[1]);
        replyTo.send( response );
        this.port.close();
      }
    );
  }
}

class Starter extends Isolate{
ReceivePort _receivePort;
 
    Starter.start() :
        _receivePort = new ReceivePort() {
            this._receivePort.receive(
                void _(var message, SendPort replyTo) {
                    print ("Receiving from Worker: ${message}");
                    _receivePort.close();
                }
            );
 
            Ant ant = new Ant();
            ant.spawn().then((SendPort port) {
                port.send('Ping', _receivePort.toSendPort());
        });
    }
}
main(){
 new Starter.start();
}
