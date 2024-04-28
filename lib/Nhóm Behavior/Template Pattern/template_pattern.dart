abstract class Page{


  void header(){
    print("Header");
  }

  void body();

  void footer(){
    print("Footer");
  }

   void showPage(){
    header();
    body();
    footer();
  }
}

class HomePage extends Page{


  @override
  void header() {
    print("This header from homepage");
  }

  @override
  void body() {
    print("Home Page");
  }

}

class CardPage extends Page{
  

  @override
  void body() {
    print("Card Page");
  }

}

main(){
  HomePage().showPage();
  CardPage().showPage();
}