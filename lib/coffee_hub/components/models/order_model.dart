import 'package:coffee_shop_app/coffee_hub/features/customer/data_base/dbhelper.dart';

class Order{
  int orderId;
  String productId;
  int orderCount;
  int orderSize;
  int orderSugar;
  String userId;
  int imageUrl;
  double productPrice;
  String productName;

   Order({this.productId,this.orderCount,this.orderSize, this.orderSugar,this.userId,
   this.imageUrl,this.productPrice,this.productName});

Order.fromJson(Map<String,dynamic> map){
    this.orderId=map[DBHelper.orderIdColumn];
    this.productId=map[DBHelper.productIdColumn];
    this.orderCount=map[DBHelper.orderCountColumn];
    this.orderSize=map[DBHelper.orderSizeColumn];
    this.orderSugar=map[DBHelper.orderSugarColumn];
    this.userId=map[DBHelper.orderUserIdColumn];
    this.productName=map[DBHelper.orderProductNameColumn];
    this.productPrice=map[DBHelper.orderProductPriceColumn];
    this.imageUrl=map[DBHelper.orderProductImageUrlColumn];
  }

toJson(){
  return {
    DBHelper.productIdColumn: this.productId,
    DBHelper.orderCountColumn: this.orderCount,
    DBHelper.orderSizeColumn: this.orderSize,
    DBHelper.orderSugarColumn: this.orderSugar,
    DBHelper.orderUserIdColumn: this.userId,
    DBHelper.orderProductNameColumn: this.productName,
    DBHelper.orderProductPriceColumn: this.productPrice,
    DBHelper.orderProductImageUrlColumn: this.imageUrl
  };
}
}

