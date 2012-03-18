main(){
  writeln("testrunner");
 
  var tests = {"TestAnt":new TestAnt()};
  tests.forEach( ( testName, testInstance ) => executeTest(testName,testInstance ) );
  
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
 