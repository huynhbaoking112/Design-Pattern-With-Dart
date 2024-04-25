class Computer {

  String _os;
  String _office;
  String _antivirus;
  String _browser;
  String? _other;

  Computer( this._os, this._office, this._antivirus, this._browser );

  set other(String otherNew){
      _other = otherNew;
  }

  Computer clone(){
    return Computer(_os, _office, _antivirus, _browser);
  }

}



main(){
  Computer king = Computer('ios', 'microsoft', 'BKAV', 'Chorme');
  king.other='annna';
  print(king._other);
  Computer bin = king.clone();
  print(bin._other);
  Computer son = king.clone();
  
  son.other = 'asdasd';
  print(son._other);


}