// //Abstract
// abstract class Bank{
  
//   Account account;
//   Bank(this.account);


//    openAccount();

// }

// class VietcomBank extends Bank{
//   VietcomBank(Account account) : super(account);

  
//   @override
//   openAccount() {
//     this.account.openAccount(); 
//   }
  
 
// }

// //implementor 
// abstract class Account{
//   openAccount();
// }

// class CheckingAccount implements Account{
//   @override
//   openAccount() {
//     print("day la tai khoan CheckingAccount");
//   }
// }
// class SavingAccount implements Account{
//   @override
//   openAccount() {
//     print("day la tai khoan SavingAccount");
//   }
// }


// void main() {
//   Bank king = VietcomBank(CheckingAccount());
//   king.openAccount();
// }


abstract class Bank{

  Account account;
  Bank(this.account);

  createAccount();

}

abstract class Account{
  createAccount();
}

class SavingAccount extends Account {
  @override
  createAccount() {
   print("Saving Account");
  }
}

class CheckingAccount extends Account {
  @override
  createAccount() {
   print("Checking Account");
  }
}

class VietcomBank extends Bank{
  VietcomBank(Account account):super(account);
  
  @override
  createAccount() {
    account.createAccount();
  }

  
}

main(){
  Bank king = VietcomBank(CheckingAccount());
  king.createAccount();
}


// abstract class Game{

//   PlatForm platForm;
//   Game(this.platForm);

//   createPlatform();

// }

// abstract class PlatForm {
//   createPlatform();
// }

// class IOSPlatform implements PlatForm{
//   @override
//   createPlatform() {
//     print("Create in ios platform");
//   }
// }

// class Android implements PlatForm{
//   @override
//   createPlatform() {
//     print("Create in android platform");
//   }
// }

// class FlappyBird extends Game{
//   FlappyBird(PlatForm platForm):super(platForm);
  
//   @override
//   createPlatform() {
//     platForm.createPlatform();
//   }
// }

// main(){
//   Game king = FlappyBird(Android());
//   king.createPlatform();
// }