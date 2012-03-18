
class MessageID{
  static final POSITION= "positsion";
  static final SNIFF = "sniff";
}
class Message{
  factory Message.position(int x, int y){
    return { "id":MessageID.POSITION,"x":x,"y":y};
  }
  factory Message.sniff(smelt){
    return {"id":MessageID.SNIFF,"smelt":smelt};
  }
}
