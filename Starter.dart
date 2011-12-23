class Starter extends Isolate{
  main() {
    port.receive((message, replyTo) {
    if (message == null) port.close();
    else appendMessage(message);
    });
 }
  void appendMessage(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML += "<br> $message";
  }
}