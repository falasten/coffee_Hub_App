
import 'package:coffee_shop_app/coffee_hub/components/models/admin_order_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/ui/widgets/get_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminOrdersListItem extends StatelessWidget {
  AdminOrder order;
  //Coffee cc;
  AdminOrdersListItem({this.order});
  @override
  Widget build(BuildContext context) {
    //print(cc.name);
    return Card(
      shadowColor: Colors.grey,
      elevation: 0,
      color: backGroundColor,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 70,
            height: 70,
            child: GetDrinksImage(imageNO: order.imageUrl,)
          ),
          Expanded(
              child: ListTile(
            title: Text('${order.productName}',
                style: GoogleFonts.oswald(
                    color: titleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w200)),
            subtitle: Text('${order.productPrice} \$',
                style: GoogleFonts.oswald(
                    color: titleColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
          )),
          Text('${order.orderCount}',
              style: GoogleFonts.oswald(
                  color: titleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            width: 15,
          ),
          Image(image: order.orderSugar==0?AssetImage('assets/images/cartnosugar.png'):
          order.orderSugar==1?AssetImage('assets/images/cartonesugar.png'):
          order.orderSugar==2?AssetImage('assets/images/carttwosugar.png'):
          AssetImage('assets/images/cartthreesugar.png')
          ),
          SizedBox(
            width: 15,
          ),
          Image(image: order.orderSize==0?AssetImage('assets/images/cartsmallsize.png'):
          order.orderSize==1?AssetImage('assets/images/cartmediumsize.png'):
          AssetImage('assets/images/cartlargesize.png')
          )
        ],
      ),
    );
  }
}

