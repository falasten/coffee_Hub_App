
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app/coffee_hub/components/models/user_model.dart';
import 'package:coffee_shop_app/coffee_hub/services/auth_client.dart';
import 'package:flutter/material.dart';
class UserProvider extends ChangeNotifier {
UserModel userModel;

get currentUser{
    getCurrentUser();
    return userModel;
  }
insertNewUser(UserModel userModel) async {
    await FireAuthHelper.fireAuthHelper.addOneUserToFirestore(userModel);
    notifyListeners();
  }

updateUser(UserModel userModel) async {
    await FireAuthHelper.fireAuthHelper.updateProfile(userModel);
    getCurrentUser();
    notifyListeners();
  }

Future<UserModel>getCurrentUser()async{
  userModel = await FireAuthHelper.fireAuthHelper.getCurrentUser();
  notifyListeners();
}
  
  
}

