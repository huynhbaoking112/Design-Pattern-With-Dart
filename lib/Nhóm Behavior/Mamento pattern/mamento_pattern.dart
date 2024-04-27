//Mamento 
class Mamento {

  int vitri;

  Mamento(this.vitri);
}

class  NhanVat{

  String name;
  int viTri = 0;

  NhanVat(this.name);

  void diLen(){
    viTri++;
  }

  void diXuong(){
    viTri--;
  }

  //Luu vitri
  Mamento luu(){
    return Mamento(viTri);
  }

  void hoanTacViTriCu(Mamento mamento){
    viTri= mamento.vitri;
    print("Da tro ve vi tri " + viTri.toString());
  }

  void viTriHienTai(){
    print(viTri);
  }

}

//CareTaker

class CareTaker{

  List<Mamento> allMamento = [];

  void add(Mamento mamento){
    allMamento.add(mamento);
  }

  Mamento getMamento(int index){
    return allMamento[index];
  }

  int chieudai(){
    return allMamento.length;
  }

}


main(){

  CareTaker careTaker = CareTaker();
  NhanVat nhanVat = NhanVat("King");

  print("Vi tri ban dau");
  nhanVat.viTriHienTai();

  print("Tien len");
  nhanVat.diLen();
  nhanVat.viTriHienTai();
  //lưu 
  careTaker.add(nhanVat.luu());

  print("tien len 2");
  nhanVat.diLen();
  nhanVat.viTriHienTai();

  //Hoan tac
  nhanVat.hoanTacViTriCu(careTaker.getMamento(careTaker.chieudai()-1));
  nhanVat.viTriHienTai(); 


}
