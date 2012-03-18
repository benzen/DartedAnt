

class Board extends Isolate{

  Map<String, int> cases = null;
  final int eatX = Config.eatX ;
  final int eatY = Config.eatY ;
  final int anthillX = Config.anthillX;
  final int anthillY = Config.anthilly;
  final int height = Config.boardBoundX;
  final int widht  = Config.boardBoundY;

  Board(){
    this.cases= new Map();
    for(var i = 0; i<this.height;i++){  
      for(var j = 0; j<this.widht;j++){
        
        this.cases["$i $j"]=0;
      }
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
    port.receive((message,SendPort replyTo){
      if(message == null){
        port.close();
      }else{
        if(message["id"] == MessageID.POSITION)
        replyTo.send(new Message.sniff(antMove(message["x"],message["y"])));
      }
    });
  }
}