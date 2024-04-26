class AccountService {
  getAccount(String email){
    print("Getting the account of " + email);
  }
}

class PaymentService{

  void paymentByPaypal(){
    print('Payment by Paypal');
  }
  void paymentByCreditCard(){
    print('Payment by CreditCard');
  }
  
  void paymentByEbankingAccount(){
    print('Payment by EbankingAccount');
  }
  
  void paymentByCash(){
    print('Payment by Cash');
  }
}

class ShippingService{
  void freeShipping(){
    print('Free Shipping');
  }

  void standardShipping(){
    print("Standard Shipping");
  }

  void expressShipping(){
    print("Express Shipping");
  }
}

class EmailService{
  void sendMail( String email){
    print("Sending an email to "+ email);
  }
}

class SmsService{
  void sendSMS(String mobilePhone){
    print("Sending an message to "+ mobilePhone);
  }
}



// Facade layer (Lưu ý đây là Singleton Pattern)

class ShopFacade {

  //instance
  static  ShopFacade? _shopFacade;

  late AccountService _accountService;
  late PaymentService _paymentService;
  late ShippingService _shippingService;
  late EmailService _emailService;
  late SmsService _smsServicel;
  
  //Private Constructor
  ShopFacade._internal(){
    _accountService = AccountService();
    _paymentService = PaymentService();
    _shippingService = ShippingService();
    _emailService = EmailService();
    _smsServicel = SmsService();
  }

    static ShopFacade get shopFacade{
    if(_shopFacade == null){
      _shopFacade = ShopFacade._internal();
    }
    return _shopFacade!;
  }

  //Kien truc phan mem
  void process(String email, PAYMENTSERVICE paymentservice, SHIPPINGSERVICE shippingservice){
    _accountService.getAccount(email);
    FactoryPaymentService(paymentservice, _paymentService).create();
    FactoryShippingService(shippingservice, _shippingService).create();
    _emailService.sendMail(email);
    print("Done");
  }
}

//Factory PaymentService

class FactoryPaymentService{
  PAYMENTSERVICE _PAYMENTSERVICE;
  PaymentService _paymentService;
  FactoryPaymentService(this._PAYMENTSERVICE, this._paymentService);
  create(){
    switch(_PAYMENTSERVICE){
      case PAYMENTSERVICE.PAYMENTBYCASH:
        _paymentService.paymentByCash();
      case PAYMENTSERVICE.PAYMENTBYCREDITCARD:
        _paymentService.paymentByCreditCard();
      case PAYMENTSERVICE.PAYMENTBYEBANKINGACCOUNT:
        _paymentService.paymentByEbankingAccount();
      case PAYMENTSERVICE.PAYMENTBYPAYPAL:
        _paymentService.paymentByEbankingAccount();
      default:
        throw Exception("Not have a service");
    }
  }
}

//Factory ShippingService
class FactoryShippingService{
   SHIPPINGSERVICE _SHIPPINGSERVICE;
  ShippingService _shippingService;
  FactoryShippingService(this._SHIPPINGSERVICE, this._shippingService);
  create(){
    switch(_SHIPPINGSERVICE){
      case SHIPPINGSERVICE.EXPRESSSHIPPING:
        _shippingService.expressShipping();
      case SHIPPINGSERVICE.FREESHIPPING:
        _shippingService.freeShipping();
      case SHIPPINGSERVICE.STANDARDSHIPPING:
        _shippingService..standardShipping();
      default:
        throw Exception("Not have a service");
    }
  }
}






enum PAYMENTSERVICE{
  PAYMENTBYPAYPAL,
  PAYMENTBYCREDITCARD,
  PAYMENTBYEBANKINGACCOUNT,
  PAYMENTBYCASH
}

enum SHIPPINGSERVICE{
  FREESHIPPING,
  STANDARDSHIPPING,
  EXPRESSSHIPPING
}

main(){
  ShopFacade king = ShopFacade.shopFacade;
  king.process("king77nt4321@gmail.com", PAYMENTSERVICE.PAYMENTBYCASH, SHIPPINGSERVICE.EXPRESSSHIPPING);
}