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
}