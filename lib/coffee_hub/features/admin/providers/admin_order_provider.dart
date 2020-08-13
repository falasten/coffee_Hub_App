import 'package:coffee_shop_app/coffee_hub/components/models/admin_order_model.dart';
import 'package:coffee_shop_app/coffee_hub/components/models/coffee_model.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/repositories/admin_repositories.dart';
import 'package:flutter/material.dart';

class AdminOrderProvider extends ChangeNotifier {
  List<AdminOrder> allOrders = [];
  String productId;
  int orderCount;
  int orderSize;
  int orderSugar;
  String userId;

  get allOrder{
    getAllOrders();
    return allOrders;
  }

  Future<List<AdminOrder>> getAllOrders() async {
    allOrders = await AdminRepository.adminRepository.getAllOrders();
    notifyListeners();
  }

  Future<Coffee> getOneCoffees(String productId) async {
    Coffee coffee = await AdminRepository.adminRepository.getOneCoffees(productId);
    notifyListeners();
    return coffee;
  }
  deleteOrder(String ordertId) async {
    await AdminRepository.adminRepository.deleteOrder(ordertId);
    getAllOrders();
  }

  

}
