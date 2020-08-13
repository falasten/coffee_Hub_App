// import 'package:coffee_shop_app/coffee_hub/components/models/admin_order_model.dart';
// import 'package:coffee_shop_app/coffee_hub/features/admin/providers/admin_order_provider.dart';
// import 'package:coffee_shop_app/coffee_hub/features/admin/ui/widgets/cart_list_item.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CartListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Expanded(
//           child: Consumer<AdminOrderProvider>(
//             builder: (context, AdminOrderProvider value, child) {
//               List<AdminOrder> orders=value.allOrder;
//               return ListView.builder(
//                         itemCount: orders.length,
//                         itemBuilder: (context, index) {
//                           //Coffee coffee=value.orderCoffee(orders[index].productId);
//                           return Dismissible(
//                               key: Key(orders[index].toString()),
//                               onDismissed: (direction) {
//                                 // Provider.of<AdminOrderProvider>(context,
//                                 //         listen: false)
//                                 //     .deleteOrder(orders[index]);
//                               },
//                               child: GestureDetector(
//                                 onTap: () {
//                                   // Navigator.push(
//                                   //     context,
//                                   //     MaterialPageRoute(
//                                   //         builder: (context) => EditCartScreen(
//                                   //               order: orders[index],
//                                   //             )));
//                                 },
//                                 child: AdminOrdersListItem(order: orders[index]
//                                 ),
//                               ));
//                         },
//                       );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:coffee_shop_app/coffee_hub/components/models/admin_order_model.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/providers/admin_order_provider.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/ui/widgets/cart_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Consumer<AdminOrderProvider>(
            builder: (context, AdminOrderProvider value, child) {
              List<AdminOrder> orders = value.allOrder;
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                      key: Key(orders[index].orderId.toString()),
                      onDismissed: (direction) {
                        value.deleteOrder(orders[index].orderId);
                      },
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: AdminOrdersListItem(order: orders[index]
                        ),
                      ));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
