abstract class State{

  void handleChangeState(){
    print(this.runtimeType.toString());
  }
}


class Document{

  State _currentState;
  Document(this._currentState);

  get currentState => _currentState;

  set setCurrentState(State state){
    _currentState = state;
  }

  void xuatTrangThai(){
    _currentState.handleChangeState();
  }

}

class CreateNewDoc extends State{

}
class Submitted extends State{

}
class APPROVED extends State{

}
class REJECTED extends State{

}

main(){
  Document doc = Document(CreateNewDoc());
  doc.xuatTrangThai();
  doc.setCurrentState=Submitted();
  doc.xuatTrangThai();
}