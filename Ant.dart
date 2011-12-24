
class Ant extends Isolate {
  int x,y;
  Board board;
 
  Ant(){
//    this.board = board;
    this.x = 0;
    this.y = 0;
  }
 
  int randomPercentage() => ( Math.random()*100).toInt() ;
  moveToRandomPosition(){
     
     var frontOrBack = randomPercentage();
     var leftOrRight = randomPercentage();
     
     var lateralMove = (leftOrRight>50)?1:-1;
     var frontMove = frontOrBack>50?1:-1;
     
     this.x += frontMove;
     this.y += lateralMove;
     
     
  }
  
  void appendMessage(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML += "<br> $message";
  }
  
  initialMove(){
    moveToRandomPosition();
    board.port.toSendPort().send(Message.position(this.x,this.y));
  }
  
  main() {
   // initialMove();
    
    
    this.port.receive((var message, SendPort replyTo) {
      if(message == null){
        this.port.close();
      }else{
        if(message["id"] == MessageID.SNIFF){     
          appendMessage("I found ${message["smelt"]}");
          moveToRandomPosition();
          replyTo.send(Message.position(this.x,this.y));
        }
      }
    }
    );
  }

}
