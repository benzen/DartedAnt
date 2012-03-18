
class TestAnt extends TestCase{
  DartedAnt.Ant ant;
  setup(){
    ant= new DartedAnt.Ant();
  }
  tearDown(){
    ant=null;
  }
  
  testInitialization(){
    Expect.equals(0,ant.x);
    Expect.equals(0, ant.y);
  }
  testRandomPercentage(){
    Expect.notEquals(ant.randomPercentage(), ant.randomPercentage());
  }
  testMoveToRandomPosition(){
    var startX = ant.x;
    var startY = ant.y;
    ant.moveToRandomPosition();
    //assert that there was a real move
    Expect.isTrue( ( startX != ant.x ) || ( startY != ant.y ) );
    var deltaX = Math.max(startX,ant.x)-Math.min(startX,ant.x);
    var deltaY = Math.max(startY,ant.y)-Math.min(startY,ant.y);
    Expect.isTrue( deltaX == 0 || deltaX == 1 );
    Expect.isTrue( deltaY == 0 || deltaY == 1 );
  }
  testReactionToNullMessage(){
    ant.spawn().then((port){
      port.call(null);
      Expect.isTrue(port.isClosed());
    });
  }
  testReactionToSmellMessage(){
    ant.spawn().then((port){
      port.call(new DartedAnt.Message.sniff("nothing"));
      Expect.isFalse(port.isClosed());
    });
    
  }
  
  run(){
    testInitialization();
    testRandomPercentage();
    testMoveToRandomPosition();
  }
  
}
