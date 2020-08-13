import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app/coffee_hub/components/models/admin_order_model.dart';
import 'package:coffee_shop_app/coffee_hub/components/models/coffee_model.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/repositories/admin_client.dart';

class AdminRepository {
  AdminRepository._();
  static AdminRepository adminRepository = AdminRepository._();
  // addNewProduct(Product product, File imageFile) async {
  //   try {
  //     String url = await AdminClient.adminClient.uploadImage(imageFile);
  //     product.imageUrl = url;
  //     String id = await AdminClient.adminClient.uploadProduct(product);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<List<Coffee>> getAllCoffees() async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getAllCoffees();
    List<Coffee> coffees =
        documents.map((e) => Coffee.fromDocumentSnapshot(e)).toList();
    return coffees;
  }
  Future<Coffee> getOneCoffees(String productId) async {
    DocumentSnapshot documents =
        await AdminClient.adminClient.getOneCoffee(productId);
    Coffee coffee = Coffee.fromDocumentSnapshot(documents);
    return coffee;
  }

  Future<List<AdminOrder>> getAllOrders() async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getAllOrders();
    List<AdminOrder> orders =
        documents.map((e) => AdminOrder.fromDocumentSnapshot(e)).toList();
    return orders;
  }
  deleteOrder(String orderId) async {
    try {
      await AdminClient.adminClient.deleteOrder(orderId);
    } catch (error) {
      print(error);
    }
  }
}
