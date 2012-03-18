
class TestAnt extends TestCase{
  DartedAnt.Ant ant;
  setup(){
    ant= new DartedAnt.Ant();
  }
  tearDown(){
    ant=null;
  }
  
  testInitialization(){
    Expect.equals(10,ant.x);
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
  }
  
  run(){
    testInitialization();
    testRandomPercentage();
    testMoveToRandomPosition();
  }
  
}
