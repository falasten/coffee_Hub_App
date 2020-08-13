import 'dart:io';
import 'package:coffee_shop_app/coffee_hub/components/models/order_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/constant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final String databaseName = 'CoffeeDataBase';
  static final String tableName = 'OrdersTable';
  static final String orderIdColumn = 'OrderId';
  static final String productIdColumn = 'ProductId';
  static final String orderCountColumn = 'OrderCount';
  static final String orderSizeColumn = 'OrderSize';
  static final String orderSugarColumn = 'OrderSugar';
  static final String orderUserIdColumn = 'OrderUserId';
  static final String orderProductNameColumn = 'OrderProductName';
  static final String orderProductPriceColumn = 'OrderProductPrice';
  static final String orderProductImageUrlColumn = 'OrderProductImageUrl';

  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();
  factory DBHelper() {
    dbHelper.initDb();
    return dbHelper;
  }
  Database database;
  initDb() async {
    if (database == null) {
      database = await intializingDataBase();
      return database;
    } else {
      return database;
    }
  }

  Future<Database> intializingDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
       CREATE TABLE $tableName(
         $orderIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
         $productIdColumn TEXT NOT NULL,
         $orderCountColumn INTEGER NOT NULL,
         $orderSizeColumn INTEGER NOT NULL,
         $orderSugarColumn INTEGER NOT NULL,
         $orderUserIdColumn TEXT NOT NULL,
         $orderProductNameColumn TEXT NOT NULL,
         $orderProductPriceColumn REAL NOT NULL,
         $orderProductImageUrlColumn INTEGER NOT NULL

       )
        ''');
      },
    );
    return db;
  }
  insertNewOrder(Order order) async{
    database = await initDb();
    database.insert(tableName, order.toJson());
    List<Map<String, dynamic>> results = await database.query(tableName);
    print(results);
  }
  Future<List<Map<String, dynamic>>> getAllOrders() async{
    database = await initDb();
    List<Map<String, dynamic>> results = await database.query(tableName);
    print(results);
    return results;
  }
  Future<List<Map<String, dynamic>>> getUserOrders() async{
    database = await initDb();
    List<Map<String, dynamic>> results = await database.query(tableName,where: '$orderUserIdColumn=?',whereArgs: [userId]);
    print(results);
    return results;
  }
  deleteFromOrders(Order order) async{
    database = await initDb();
    database.delete(tableName,where: '$orderIdColumn=?',whereArgs: [order.orderId]);
  }

   updateOrder(Order order) async{
    database = await initDb();
    database.update(tableName, order.toJson(),where: '$orderIdColumn=?',whereArgs: [order.orderId]);
  }
  deleteAllOrders() async{
    database = await initDb();
    database.delete(tableName);
  }

}
