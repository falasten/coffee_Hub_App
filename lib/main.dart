import 'package:coffee_shop_app/coffee_hub/features/admin/providers/admin_order_provider.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/providers/coffee_provider.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/providers/order_provider.dart';
import 'package:coffee_shop_app/coffee_hub/services/providers/user_provider.dart';
import 'package:coffee_shop_app/coffee_hub/services/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size s =MediaQuery.of(context).size;
    //       ScreenUtil.init(context);
    //       ScreenUtil.init(context,width: 500,height: 800);
    //       print('**************************************');
    //       print(s.width);
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CoffeeProvider>(
          create: (BuildContext context) {
            return CoffeeProvider();
          },
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: (BuildContext context) {
            return OrderProvider();
          },
        ),
        ChangeNotifierProvider<AdminOrderProvider>(
          create: (BuildContext context) {
            return AdminOrderProvider();
          },
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (BuildContext context) {
            return UserProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'Coffee Hub',
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context){
         // Size s =MediaQuery.of(context).size;
          // ScreenUtil.init(context);
          // ScreenUtil.init(context,width: s.width,height: s.height);
          return RegisterScreen();
        },)
      ),
    );
  }
}


