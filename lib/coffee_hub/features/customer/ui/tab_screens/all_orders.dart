import 'package:coffee_shop_app/coffee_hub/components/models/order_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/providers/order_provider.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/repositories/cart_client.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/ui/screens/edit_cart_screen.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/ui/widgets/orders_list_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartListScreen extends StatelessWidget {
  // var x;
  // getDate(BuildContext context)async{
  //   Coffee orderItem = await Provider.of<CoffeeProvider>(context,listen: false).getOneCoffees('LqLU6iEj5dI0D7vhUyHq');
  //   x=orderItem.price;
  //   print(orderItem.name);
  // }
  //double totalPrice=7.0 ;

// void getTotal(BuildContext context) async{
//   double total = await Provider.of<OrderProvider>(context,listen: false).getTotal();
//   print(total);
//   //setState(() => totalPrice = total);
//   //totalPrice=total;
// }
  @override
  Widget build(BuildContext context) {
    // getDate(context);
    // print(x);
    return Column(
      children: <Widget>[
        Expanded(
          child: Consumer<OrderProvider>(
            builder: (context, OrderProvider value, child) {
              return FutureBuilder<List<Order>>(
                future: value.getUserOrders(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      List<Order> orders = snapshot.data;
                      return ListView.builder(
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                              key: Key(orders[index].toString()),
                              onDismissed: (direction) {
                                Provider.of<OrderProvider>(context,
                                        listen: false)
                                    .deleteOrder(orders[index]);
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditCartScreen(
                                                order: orders[index],
                                              )));
                                },
                                child: OrdersListItem(order: orders[index]
                                ),
                              ));
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            },
          ),
        ),
        Divider(
          color: mainColor,
        ),
        Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   'Total : $totalPrice\$',
              //   style: GoogleFonts.oswald(
              //       fontSize: 20,
              //       fontWeight: FontWeight.w600,
              //       color: mainColor),
              // ),
              // SizedBox(
              //   width: 40,
              // ),
              RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text('Check Out',
                      style: GoogleFonts.oswald(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  onPressed: () async{
                    List<Order> ordersFutureList = await Provider.of<OrderProvider>(context,listen: false).getUserOrders();
                    ordersFutureList.forEach((order) {
                      OrdersClient.ordersClient.addOneOrderToFirestore(order);
                    });
                    Provider.of<OrderProvider>(context,listen: false).deleteAll();
                  }),
            ],
          ),
        )
      ],
    );
  }
}
