enum Material{
  Plastic,
  Wood
}


//Super factory
class ChooseMaterial {

   ChooseMaterial._internal();

 static chooseMaterial(Material material){
    switch(material){
      case Material.Plastic:
        return new PlasticFurniture();
      case Material.Wood:
        return new WoodFurniture();
    }
  }
}

//Abstract Factory

abstract class Furniture{
  Chair chair();
  Table table();
}

//Abstract Product
abstract class Chair{
  String createChair();
}

abstract class Table{
  String createTable();
}

//Product
class PlasticChair implements Chair{
  @override
  String createChair() {
    return "PlasticChair";
  }
}

class PlasticTable implements Table{
  @override
  String createTable() {
    return 'Plastic Table';
  }
}

class WoodChair implements Chair{
  @override
  String createChair() {
    return 'Wood Chair';
  }
}
class WoodTable implements Table{
  @override
  String createTable() {
    return 'Wood Table';
  }
}



//ConcreteFactory
class PlasticFurniture implements Furniture{
  @override
  Chair chair() {
    return PlasticChair();
  }

  @override
  Table table() {
    return PlasticTable();
  }

}

class WoodFurniture implements Furniture{
  @override
  Chair chair() {
    return WoodChair();
  }

  @override
  Table table() {
    return WoodTable();
  }

}


main(){
  Furniture choose = ChooseMaterial.chooseMaterial(Material.Plastic);

  print(choose.chair().createChair());
}