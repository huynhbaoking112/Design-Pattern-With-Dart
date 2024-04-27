// Command
abstract class diChuyen{
  void excuted();
}

//Di chuyen len
class len extends diChuyen{
  @override
  void excuted() {
    print('Di chuyen len');
  }
}

//Xuong
class xuong extends diChuyen{
  @override
  void excuted() {
    print('Di chuyen xuong');
  }
}

//Trai
class trai extends diChuyen{
  @override
  void excuted() {
    print('Di chuyen trai');
  }
}

//Phai
class phai extends diChuyen{
  @override
  void excuted() {
    print('Di chuyen phai');
  }
}

//tien
class tien extends diChuyen{
  @override
  void excuted() {
    print('Di chuyen tien');
  }
}


//lui
class lui extends diChuyen{
  @override
  void excuted() {
    print('Di chuyen lui');
  }
}



//Invoker
class DieuKhien{

  diChuyen thucthi;
  DieuKhien(this.thucthi);

  void process(){
    thucthi.excuted();
  }

}


main(){
  DieuKhien(phai()).process();
}