import 'package:cloud_firestore/cloud_firestore.dart';

class Coffee {
  String documentId;
  String name;
  double price;
  int imageUrl;
  Coffee(
      {
      this.documentId,
      this.imageUrl,
      this.name,
      this.price});
  Coffee.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.documentId = documentSnapshot.documentID;
    this.name = documentSnapshot.data['name'];
    this.imageUrl = documentSnapshot.data['imageUrl'];
    this.price = documentSnapshot.data['price'];
  }
  toJson() {
    return {
      'name': this.name,
      'price': this.price,
      'imageUrl': this.imageUrl
    };
  }
}
