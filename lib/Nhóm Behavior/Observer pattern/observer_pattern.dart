//Subject
abstract class Subject {
  void addObserver(Observer observer);

  void removeObserver(Observer observer);

  void notificationObserver(String msg);
}

abstract class Observer {
  void update(String msg);
}

class WebSite extends Subject {
  int luotXem = 0;
  List<Observer> allObserver = [];

  @override
  void addObserver(Observer observer) {
    if (!allObserver.contains(observer)) {
      allObserver.add(observer);
      // notificationObserver(" them nguoi lang nghe");
    }
  }

  @override
  void notificationObserver(String msg) {
    for (Observer observer in allObserver) {
      observer.update(msg);
    }
  }

  @override
  void removeObserver(Observer observer) {
    if (allObserver.contains(observer)) {
      allObserver.remove(observer);
      // notificationObserver(" xoa nguoi lang nghe");
    }
  }

  void tangLuotXem() {
    luotXem++;
    notificationObserver(" Cap nhat luot xem ");
  }
}

class ConcreteObserver extends Observer {
  String name;
  ConcreteObserver(this.name);

  @override
  void update(String msg) {
    print(name + msg);
  }
}

main() {
  ConcreteObserver concreteObserver1 = ConcreteObserver("emailService");
  ConcreteObserver concreteObserver2 = ConcreteObserver("CallService");
  ConcreteObserver concreteObserver3 = ConcreteObserver("UserService");

  WebSite web = WebSite();
  web.addObserver(concreteObserver1);
  web.addObserver(concreteObserver2);
  web.addObserver(concreteObserver3);

  web.removeObserver(concreteObserver1);

  web.tangLuotXem();

}
