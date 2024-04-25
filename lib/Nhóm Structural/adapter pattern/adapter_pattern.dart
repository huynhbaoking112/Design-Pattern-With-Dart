abstract class VietnameseTarget {

  send(String words);

}

class JapaneseAdaptee{
    void receive(String words){
      print('Retrieving words from Adapter ...');
      print(words);
    }
}


class TranslatorAdapter implements VietnameseTarget{
  
  JapaneseAdaptee japaneseAdaptee;
  
  TranslatorAdapter(this.japaneseAdaptee);

  @override
  send(String words) {
    print("Reading words");
    print(words);
    String vietnam = translate(words);
    this.japaneseAdaptee.receive(vietnam);

  }

  String translate(String vietnameseWorks){
    print("Transalted!");
    return "こんにちは";
  }


}

main(){
  TranslatorAdapter(new JapaneseAdaptee()).send("king");
}