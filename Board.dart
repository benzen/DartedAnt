class Board extends Isolate{

  Map<String, int> cases = null;
  final int eatX = 10 ;
  final int eatY = 10 ;
  final int anthillX = 0;
  final int anthillY = 0;
  final int height = 10;
  final int widht  = 10;

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
        replyTo.send(Message.sniff(antMove(message["x"],message["y"])));
      }
    });
  }
}