
abstract class Bank{
  String getBankName();
}

class TPBank implements Bank{
  @override
  String getBankName() {
   return 'TPBank';
  }
}

class VietcomBank implements Bank{
  @override
  String getBankName() {
    return "VietcomBank";
  }
}


class ChooseBank{
  
  ChooseBank._internal();

  static Bank chooseFun(BankType nameBank){
    switch(nameBank){
      case BankType.TPBank:
        return TPBank();
      case BankType.VietcomBank:
        return VietcomBank();
      default:
        throw Exception('Bank not found');
    }
  }

}

enum BankType{
  TPBank,
  VietcomBank
}







void main(){
  Bank test = ChooseBank.chooseFun(BankType.TPBank);
  print( test.getBankName());
}


//Kết luận rút ra từ Factory 


  //1) Khi naò sử dụng ?

    //- Sử dụng khi chúng ta có một super class với nhiều class con và dựa trên đầu vào, chúng ta cần trả về một class con. Mô hình này giúp chúng ta đưa trách nhiệm của việc khởi tạo một lớp từ phía người dùng (client) sang lớp Factory

    //- Chúng ta không biết sau này sẽ cần đến những lớp con nào nữa. Khi cần mở rôgj hãy tạo ra sub class và implement thêm vào factory method cho việc khởi tạo sub class này

  //2) Lợi ích của Factory Pattern ?
    
    //- Factory Pattern giúp giảm sự phụ thuộc giữa các module (loose coupling): cung cấp 1 hướng tiếp cận với Interface thay thì các implement. Giúp chuơng trình độc lập với những lớp cụ thể mà chúng ta cần tạo 1 đối tượng, code ở phía client không bị ảnh hưởng khi thay đổi logic ở factory hay sub class.

    //- Mở rộng code dễ dàng hơn: khi cần mở rộng, chỉ việc tạo ra sub class và implement thêm vào factory method.

    //- Khởi tạo các Objects mà che giấu đi xử lí logic của việc khởi tạo đấy. Người dùng không biết logic thực sực được khởi tạo bên dưới phương thức factory.

    //- Dễ dạng quản lý life cycle của các Object được tạo bởi Factory Pattern.

    //- Thống nhất về naming convention: giúp cho các developer có thể hiểu về cấu trúc source code.