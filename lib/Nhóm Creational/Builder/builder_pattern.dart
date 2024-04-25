enum BreadType{
  SIMPLE,
  OMELETTE,
  FRIED_EGG,
  GRILLED_FISH,
  PORK,
  BEEF
}

enum OrderType{
  ON_SITE,
  TAKE_AWAY
}

enum SauceType{
  SOY_SAUCE,
  FISH_SAUCE,
  OLIVE_OIL,
  KETCHUP,
  MUSTARD
}

enum VegetableType{
  SALAD,
  CUCUMBER,
  TOMATO
}

//Product
class Order{
  OrderType? _orderType;
  BreadType? _breadType;
  SauceType? _sauceType;
  VegetableType? _vegetableType;

  Order(this._breadType, this._orderType, this._sauceType, this._vegetableType);

  @override
  String toString(){
    return "Order [orderType = "+ _orderType.toString() + ", breadType= " + _breadType.toString()+ ", sauceType= " + _sauceType.toString() +", vegetableType= "+ _vegetableType.toString() + "]";
  } 

  OrderType? getOrderType() {
        return _orderType;
    }

  BreadType? getBreadType() {
        return _breadType;
    }
  
  SauceType? getSauceType() {
        return _sauceType;
    }

  VegetableType? getVegetableType() {
        return _vegetableType;
    }

}


//builder
abstract class OrderBuilder{

  OrderBuilder orderType(OrderType orderType);

  OrderBuilder orderBread(BreadType breadType);

  OrderBuilder orderSauce(SauceType sauceType);

  OrderBuilder orderVegetable(VegetableType vegetableType);

  Order build();

}

//concreteBuilder
class FastFoodOrderBuilder implements OrderBuilder{

   OrderType? _orderType;
   BreadType? _breadType;
   SauceType? _sauceType;
   VegetableType? _vegetableType;
  
  @override
  Order build() {
    return Order(_breadType, _orderType, _sauceType, _vegetableType);
  }
  
  @override
  OrderBuilder orderBread(BreadType breadType) {
    this._breadType = breadType;
    return this;
  }
  
  @override
  OrderBuilder orderSauce(SauceType sauceType) {
    this._sauceType = sauceType;
    return this;
  }
  
  @override
  OrderBuilder orderType(OrderType orderType) {
    this._orderType = orderType;
    return this;
  }
  
  @override
  OrderBuilder orderVegetable(VegetableType vegetableType) {
    this._vegetableType = vegetableType;
    return this;
  }


}


main(){
  Order  order =FastFoodOrderBuilder().orderSauce(SauceType.FISH_SAUCE).orderType(OrderType.ON_SITE).orderVegetable(VegetableType.CUCUMBER).build();

  print(order.toString());
}