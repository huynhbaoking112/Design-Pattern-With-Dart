// Mediator

abstract class MessageMediator {
  void addUser(UserConcrete userConcrete);

  void sendGroup(UserConcrete userConcrete);

  void sendToUser(UserConcrete userConcrete, UserConcrete userTarget);
}

//concrete Mediator
class ConcreteMessageMediator implements MessageMediator {
  List<UserConcrete> allUser = [];

  @override
  void sendGroup(UserConcrete userConcrete) {
    for (int i = 0; i < allUser.length; i++) {
      if (allUser[i] != userConcrete) {
        allUser[i].recevideMessage();
      }
    }
  }

  @override
  void addUser(UserConcrete userConcrete) {
    print(userConcrete.name + " is joined group");
    allUser.add(userConcrete);
  }

  @override
  void sendToUser(UserConcrete userConcrete, UserConcrete userTarget) {
    for (int i = 0; i < allUser.length; i++) {
      if (allUser[i] == userTarget) {
        allUser[i].recevideMessage();
      }
    }
  }
}

//ConcreteUser
class UserConcrete {
  MessageMediator messageMediator;
  String name;

  UserConcrete(this.messageMediator, this.name);

  void sendMessageGroup(UserConcrete currentUser) {
    messageMediator.sendGroup(currentUser);
  }

  void sendMessageToUser(UserConcrete currentUser, UserConcrete targetUser) {
    messageMediator.sendToUser(currentUser, targetUser);
  }

  void recevideMessage() {
    print(name + " is recevide the message");
  }
}




main(){
  ConcreteMessageMediator concreteMessageMediator = ConcreteMessageMediator();


  UserConcrete user1 = UserConcrete(concreteMessageMediator, "king");
  UserConcrete user2 = UserConcrete(concreteMessageMediator, "bin");
  UserConcrete user3 = UserConcrete(concreteMessageMediator, "ngan");

  concreteMessageMediator.addUser(user1);
  concreteMessageMediator.addUser(user2);
  concreteMessageMediator.addUser(user3);

  // user1.sendMessageGroup(user1);
  user1.sendMessageToUser(user1, user2);
}