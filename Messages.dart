class MessageID{
  static final POSITION= "positwion";
  static final SNIFF = "sniff";
}
class Message{
  static position(int x, int y){
    return { "id":MessageID.POSITION,"x":x,"y":y};
  }
  static sniff(smelt){
    return {"id":MessageID.SNIFF,"smelt":smelt};
  }
}
