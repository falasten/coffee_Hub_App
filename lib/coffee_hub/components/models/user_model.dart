import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String userId;
  String userName;
  String userEmail;
  String password;
  bool isAdmin;
  String userPhone;
  String userAddress;

   UserModel({this.userName,this.userEmail,this.isAdmin,this.password});

  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.userId = documentSnapshot.documentID;
    this.userName = documentSnapshot.data['UserName'];
    this.userEmail = documentSnapshot.data['UserEmail'];
    this.isAdmin = documentSnapshot.data['IsAdmin'];
    this.password = documentSnapshot.data['Password'];
    this.userPhone = documentSnapshot.data['Phone'];
    this.userAddress = documentSnapshot.data['Address'];
  }
toJson(){
  return {
    'UserName': this.userName,
    'UserEmail': this.userEmail,
    'IsAdmin': this.isAdmin,
    'Password': this.password,
    'Phone': this.userPhone,
    'Address': this.userAddress,
  };
}
}

