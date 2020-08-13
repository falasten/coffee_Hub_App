import 'dart:io';

import 'package:coffee_shop_app/coffee_hub/components/models/coffee_model.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/repositories/admin_client.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/repositories/admin_repositories.dart';
import 'package:flutter/material.dart';

class CoffeeProvider extends ChangeNotifier {
  List<Coffee> allCoffees = [];
  String coffeeName;
  double coffeePrice;
  int coffeeImage;

  get allCoffee{
    getAllCoffees();
    return allCoffees;
  }
  setCoffeeName(String name) {
    this.coffeeName = name;
    notifyListeners();
  }

  setCoffeePrice(String price) {
    try {
      this.coffeePrice = double.parse(price);
    } catch (error) {
      print(error);
    }
  }
  setCoffeeImage(String image) {
    try {
      this.coffeeImage = int.parse(image);
    } catch (error) {
      print(error);
    }
  }

  addNewCoffee() async {
    try {
      Coffee coffee = Coffee(
        imageUrl: this.coffeeImage,
        name: this.coffeeName,
        price: this.coffeePrice,
      );
      String coffeeId = await AdminClient.adminClient.uploadCoffee(coffee);
      //assert(coffeeId != null);
      //print(coffeeId);
      getAllCoffees();
    } catch (error) {
      print(error); 
    }
  }

  Future<List<Coffee>> getAllCoffees() async {
    allCoffees = await AdminRepository.adminRepository.getAllCoffees();
    notifyListeners();
    //return allCoffees;
  }

  // Future<Coffee> getOneCoffees(String productId) async {
  //   Coffee coffee = await AdminRepository.adminRepository.getOneCoffees(productId);
  //   return coffee;
  // }


  updateCoffee(Coffee coffee) async {
    await AdminClient.adminClient.updateCoffee(coffee);
    getAllCoffees();
  }

  deleteCoffee(String coffeetId) async {
    await AdminClient.adminClient.deleteCoffee(coffeetId);
    getAllCoffees();
  }
}
