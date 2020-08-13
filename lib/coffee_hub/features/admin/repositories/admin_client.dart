import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app/coffee_hub/components/models/coffee_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminClient {
  /// check the user type
  AdminClient._();
  static AdminClient adminClient = AdminClient._();
  FirebaseStorage firebaseStorage;
  Firestore firestore;

  Firestore initFirestore() {
    if (firestore == null) {
      firestore = Firestore.instance;
      return firestore;
    } else {
      return firestore;
    }
  }

  FirebaseStorage initFirebaseStorage() {
    if (firebaseStorage == null) {
      firebaseStorage = FirebaseStorage.instance;
      return firebaseStorage;
    } else {
      return firebaseStorage;
    }
  }

  // Future<String> uploadImage(File file) async {
  //   try {
  //     firebaseStorage=initFirebaseStorage();
  //     DateTime dateTime = DateTime.now();
  //     StorageTaskSnapshot snapshot = await firebaseStorage
  //         .ref()
  //         .child('$imagesFolder/$dateTime.jpg')
  //         .putFile(file)
  //         .onComplete;
  //     String url = await snapshot.ref.getDownloadURL();
  //     return url;
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  // deleteImage(String imageUrl) async {
  //   try {
  //     await firebaseStorage.ref().child('$imagesFolder/$imageUrl').delete();
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<String> uploadCoffee(Coffee coffee) async {
    try {
      firestore=initFirestore();
      DocumentReference documentReference =
          await firestore.collection(coffeesCollection).add(coffee.toJson());
      assert(documentReference.documentID != null);
      return documentReference.documentID;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllCoffees() async {
    try {
      firestore=initFirestore();
      QuerySnapshot querySnapshot =
          await firestore.collection(coffeesCollection).getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<DocumentSnapshot> getOneCoffee(String productId) async {
    try {
      firestore=initFirestore();
      DocumentSnapshot documentSnapshot =
          await firestore.collection(coffeesCollection).document(productId).get();
      return documentSnapshot;
    } catch (error) {
      print(error);
    }
  }

//customer
  // insertNewCoffeeToCart(Coffee coffee) async {
  //   firestore=initFirestore();
  //   firestore.collection('Cart').add(coffee.toJson());
  // }

  updateCoffee(Coffee coffee) async {
    try {
      firestore=initFirestore();
      firestore
          .collection(coffeesCollection)
          .document(coffee.documentId)
          .setData(coffee.toJson());
    } catch (error) {
      print(error);
    }
  }

  deleteCoffee(String coffeeId) async {
    try {
      firestore=initFirestore();
      firestore.collection(coffeesCollection).document(coffeeId).delete();
    } catch (error) {
      print(error);
    }
  }

  deleteOrder(String orderId) async {
    try {
      firestore=initFirestore();
      firestore.collection('Orders').document(orderId).delete();
    } catch (error) {
      print(error);
    }
  }


Future<List<DocumentSnapshot>> getAllOrders() async {
    try {
      firestore=initFirestore();
      QuerySnapshot querySnapshot =
          await firestore.collection('Orders').getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }


}
