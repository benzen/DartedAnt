main(){
  writeln("testrunner");
  try{
    var tests = {"TestAnt":new TestAnt()};
    tests.forEach( ( testName, testInstance ) => executeTest(testName,testInstance ) );
  }catch(Exception e){
    writeln("Fails");
    write("<h1> <font color='red'>${e.toString()} </font></h1>");
  }
}

void executeTest(testName, testInstance){
  write("$testName ...");
  
  testInstance.setup();
  testInstance.run();
  testInstance.tearDown();
  writeln("Done");
  
}

void write(message){
   document.query('#status').innerHTML += message ;
}
void writeln(String message) {
  write( " $message <br/> ") ;
}
 