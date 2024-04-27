//Iterator
abstract class IteratorPhone {
  bool hasData();

  num nextData();
}

class ConcretorIteratorPhone implements IteratorPhone {
  List<num> danhSach;
  int index = 0;
  ConcretorIteratorPhone(this.danhSach);

  @override
  bool hasData() {
    return index < danhSach.length;
  }

  @override
  num nextData() {
    return danhSach[index++];
  }
}

class PhoneBook {
  List<num> danhsach;
  PhoneBook(this.danhsach);

  addNewPhone(num so) {
    danhsach.add(so);
  }

  void truyXuat() {
    ConcretorIteratorPhone concretorIteratorPhone =
        ConcretorIteratorPhone(danhsach);
    while (concretorIteratorPhone.hasData()) {
      print(concretorIteratorPhone.nextData());
    }
  }
}


main(){
  PhoneBook phoneBook = PhoneBook([]);

  phoneBook.addNewPhone(113);
  phoneBook.addNewPhone(114);
  phoneBook.addNewPhone(115);
  phoneBook.addNewPhone(116);
  phoneBook.addNewPhone(117);

  phoneBook.truyXuat();

}