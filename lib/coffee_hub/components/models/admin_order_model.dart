import 'package:cloud_firestore/cloud_firestore.dart';

class AdminOrder{
  String orderId;
  String productId;
  int orderCount;
  int orderSize;
  int orderSugar;
  String userId;
  int imageUrl;
  double productPrice;
  String productName;

   AdminOrder({this.productId,this.orderCount,this.orderSize, this.orderSugar,this.userId,
   this.productPrice,this.imageUrl,this.productName});

  AdminOrder.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.orderId = documentSnapshot.documentID;
    this.orderSugar = documentSnapshot.data['OrderSugar'];
    this.orderCount = documentSnapshot.data['OrderCount'];
    this.orderSize = documentSnapshot.data['OrderSize'];
    this.productId = documentSnapshot.data['ProductId'];
    this.userId = documentSnapshot.data['OrderUserId'];
    this.productName = documentSnapshot.data['OrderProductName'];
    this.productPrice = documentSnapshot.data['OrderProductPrice'];
    this.imageUrl = documentSnapshot.data['OrderProductImageUrl'];
  }
toJson(){
  return {
    'ProductId': this.productId,
    'OrderCount': this.orderCount,
    'OrderSize': this.orderSize,
    'OrderSugar': this.orderSugar,
    'OrderUserId': this.userId,
    'OrderProductName': this.productName,
    'OrderProductPrice': this.productPrice,
    'OrderProductImageUrl': this.imageUrl,
  };
}
}

