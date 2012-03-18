
class Ant extends Isolate {
  int x,y;
 
  Ant(){

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
  
  
  main() {
  
    this.port.receive((var message, SendPort replyTo) {
      if(message == null){
        this.port.close();
      }else{
        if(message["id"] == MessageID.SNIFF){     
          appendMessage("At position (x:${this.x},y:${this.y}) I found ${message["smelt"]}");
          moveToRandomPosition();
          appendMessage("new position ${this.x}, ${this.y}");
          replyTo.send(Message.position(this.x,this.y));
        }
      }
    }
    );
  }

}
