//FlyWeight
import 'dart:async';

abstract class ThuocTinhNhanVat {
  //intrinsic
  void hanhvi();
  void khanang();

  //extrinsic
  void mausac(Context context);
}

//Context
class Context {
  String color;
  Context(this.color);

  String getColor() {
    return color;
  }
}

//Concrete FlyWeight
class NhanVat implements ThuocTinhNhanVat {
  String nhanvat;
  NhanVat(this.nhanvat);

  @override
  void hanhvi() {
    print(nhanvat + "buoc di");
  }

  @override
  void khanang() {
    print(nhanvat + "ban sung");
  }

  @override
  void mausac(Context context) {
    print("Day la " + nhanvat + " co mau sac la " + context.getColor());
  }
}

//FactoryFlyWeight
class FactoryFlyWeight {
  static Map<String, NhanVat> allNhanvat = {};

  FactoryFlyWeight._internal();

  static Future<NhanVat> createOrGetNhanVat(String name) async {
    if (allNhanvat.containsKey(name)) {
      return allNhanvat[name]!;
    } else {
      await Future.delayed(Duration(seconds: 2));
      NhanVat nhanvat = NhanVat(name);
      allNhanvat[name] = nhanvat;
      return allNhanvat[name]!;
    }
  }
}

main() {
  List<NhanVat> total = [];

  void tao() async {
    var starttime = DateTime.now().second;

    NhanVat kysi = await FactoryFlyWeight.createOrGetNhanVat("kysi");
    NhanVat kysi2 = await FactoryFlyWeight.createOrGetNhanVat("kysi");
    NhanVat phapsu = await FactoryFlyWeight.createOrGetNhanVat("phapsu");

    var endtime = DateTime.now().second;
    //Thời gian tạo
    print("Thoi gian tao nhan vat la : " + (endtime - starttime).toString());

    total.add(kysi);
    total.add(kysi2);
    total.add(phapsu);

    // Tong cong nhan vat hien co
    print("Tong cong nhan vat hien co la " + total.length.toString());

    //Cac extrinsic
    kysi.mausac(Context("den"));
    kysi2.mausac(Context("xanh"));
    phapsu.mausac(Context("do"));
  }

  tao();
}
