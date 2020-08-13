import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app/coffee_hub/components/models/order_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class OrdersClient {
  OrdersClient._();
  static final OrdersClient ordersClient = OrdersClient._();
  Firestore firestore;
  FirebaseStorage firebaseStorage;
  Firestore initFireStore() {
    if (firestore == null) {
      firestore = Firestore.instance;
      return firestore;
    } else {
      return firestore;
    }
  }
FirebaseStorage initFireStorage() {
    if (firebaseStorage == null) {
      firebaseStorage = FirebaseStorage.instance;
      return firebaseStorage;
    } else {
      return firebaseStorage;
    }
  }

  addOneOrderToFirestore(Order order) async {
    firestore = initFireStore();
    firestore.collection('Orders').add(order.toJson());
  }
  addPositionToFirestore(String position, double latitude, double longitude) async {
    firestore = initFireStore();
    firestore.collection('MapPositions').add({
      'Position':position,
      'latitude':latitude,
      'longitude':longitude
    });
  }
   editPositionToFirestore(String position, double latitude, double longitude) async {
    firestore = initFireStore();
    firestore.collection('MapPositions').add({
      'Position':position,
      'latitude':latitude,
      'longitude':longitude
    });
  }
}
