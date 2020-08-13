import 'package:coffee_shop_app/coffee_hub/components/models/order_model.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/data_base/dbhelper.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier{
  final List<Order> _allOrders = [];
  

  get allOrders{
    getUserOrders();
    getAllOrders();
    return _allOrders;
  }
  Future<List<Order>> getAllOrders() async {
    List<Map<String, dynamic>> allOrders =
        await DBHelper.dbHelper.getAllOrders();
    List<Order> orders = allOrders.map((e) => Order.fromJson(e)).toList();
    return orders;
  }
Future<double> getTotal() async {
  double totalPrice=0.0;
    List<Map<String, dynamic>> allOrders =
        await DBHelper.dbHelper.getAllOrders();
    List<Order> orders = allOrders.map((e) => Order.fromJson(e)).toList();
    orders.forEach((element) {
      totalPrice+=element.productPrice;
    });
    return totalPrice;
  }


  Future<List<Order>> getUserOrders() async {
    List<Map<String, dynamic>> allOrders =
        await DBHelper.dbHelper.getUserOrders();
    List<Order> orders = allOrders.map((e) => Order.fromJson(e)).toList();
    return orders;
  }
  excuteAllOrdersMethod() {
    getUserOrders();
    getAllOrders();
    getTotal();
    notifyListeners();
  }
insertNewOrder(Order order) async {
    await DBHelper.dbHelper.insertNewOrder(order);
    excuteAllOrdersMethod();
  }

  updateOrder(Order order) async {
    await DBHelper.dbHelper.updateOrder(order);
    excuteAllOrdersMethod();
  }

  deleteOrder(Order order) async {
    await DBHelper.dbHelper.deleteFromOrders(order);
    excuteAllOrdersMethod();
  }
  deleteAll() async{
    await DBHelper.dbHelper.deleteAllOrders();
    excuteAllOrdersMethod();
  }
}
