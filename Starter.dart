  class Starter extends Isolate{
    ReceivePort _receivePort;
     
        Starter.start() :
            _receivePort = new ReceivePort() {
                this._receivePort.receive(
                    void _(var message, SendPort replyTo) {
                        print ("Receiving from Worker: ${message}");
                        _receivePort.close();
                    }
                );
     
                Ant ant = new Ant();
                ant.spawn().then((SendPort port) {
                    port.send('Ping', _receivePort.toSendPort());
            });
        }
    }