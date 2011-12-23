
class Ant extends Isolate {
  int x,y;
  Board board;
  Ant(Board board){
    this.board = board;
    this.x = 0;
    this.y = 0;
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
