// class LogLevel{

//    int level;

//   LogLevel(this.level);



// }

//  abstract class Logger {

//   late LogLevel logLevel ;
//   Logger? nextLogger;

//   Logger(this.logLevel);

//   Logger setNextLogger(Logger nextLog){
//     nextLogger = nextLog;
//     return nextLogger!;
//   }
  
//   log(LogLevel severity, String msg){
//     if(logLevel.level <= severity.level){
//       writeMessage(msg);
//     }
//     if(nextLogger != null){
//       nextLogger!.log(severity, msg);
//     }
//   }

//   writeMessage(String msg);

// }


// class ConsoleLogger extends Logger{


//   ConsoleLogger(LogLevel loglevel): super(loglevel);


//   @override
//   writeMessage(String msg) {
//     print("Consolelogger file logger: " + msg);
//   }

// }


// class FileLogger extends Logger{

//   FileLogger(LogLevel logLevel): super(logLevel);

//   @override
//   writeMessage(String msg) {
//     print("FileLogger file logger: " + msg);
//   }
  
// }

// class EmailLogger extends Logger{

//   EmailLogger(LogLevel logLevel): super(logLevel);

//   @override
//   writeMessage(String msg) {
//     print("EmailLogger file logger: " + msg);
//   }
  
// }


// class AppLogger {

//   static getLoggerApp(){
//     LogLevel consoleLevel = LogLevel(3);
//     LogLevel fileLevel = LogLevel(5);
//     LogLevel emailLevel = LogLevel(7);

//     LogLevel maxApp = LogLevel(6);

//     ConsoleLogger console = ConsoleLogger(consoleLevel);
//     FileLogger file = FileLogger(fileLevel);
//     EmailLogger email = EmailLogger(emailLevel);

//     console.setNextLogger(file);
//     file.setNextLogger(email);

//     console.log(maxApp, "Error");

        


//   }

// }

// main(){
//   AppLogger.getLoggerApp();
// }











abstract class XetQuyen{

  int soNgayCoTheXet;
  XetQuyen? nextQuyen;

  XetQuyen(this.soNgayCoTheXet);

  XetQuyen setNextQuyen(XetQuyen xet){
      nextQuyen = xet;
      return xet;
  }

  void xet(int ngayMuonNghi){
    if(ngayMuonNghi <= soNgayCoTheXet){
      print(doiTuongDangxet() + " Da xet duyet cho nghi");
    }else if(nextQuyen != null){
      print(doiTuongDangxet() + " Khong du quyen duyet cho nghi");
      nextQuyen!.xet(ngayMuonNghi);
    }
  }

  String doiTuongDangxet();

}


class Supervisor extends XetQuyen{


  Supervisor(int k):super(k);

  @override
  String doiTuongDangxet() {
    return "Supervisor";
  }

}


class Manager extends XetQuyen{


  Manager(int k):super(k);

  @override
  String doiTuongDangxet() {
    return "Manager";
  }

}


class Director extends XetQuyen{


  Director(int k):super(k);

  @override
  String doiTuongDangxet() {
    return "Director";
  }

}



class Process{
  int soNgayMuonNghi;
  Process(this.soNgayMuonNghi);

  void xet(){
    XetQuyen sup = Supervisor(3);
    XetQuyen manager = sup.setNextQuyen(Manager(5));
    manager.setNextQuyen(Director(10000000));
    sup.xet(soNgayMuonNghi);
  }

}


main(){
  Process(9).xet();
}