import 'package:coffee_shop_app/coffee_hub/components/models/coffee_model.dart';
import 'package:coffee_shop_app/coffee_hub/components/models/order_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/constants/constant.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/ui/widgets/get_images.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/providers/order_provider.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  Coffee coffee;
  CartScreen({this.coffee});
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var price = 20;
  var sizeValue;
  var sugarValue;
  var countValue = 1;

  void onAddToCart(BuildContext context) {
    Order order = Order(
        productId: widget.coffee.documentId,
        orderCount: countValue,
        orderSize: sizeValue,
        orderSugar: sugarValue,
        userId: userId,
        imageUrl: widget.coffee.imageUrl,
        productName: widget.coffee.name,
        productPrice: widget.coffee.price);
    Provider.of<OrderProvider>(context, listen: false).insertNewOrder(order);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomerHomeScreenBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.2),
                    spreadRadius: 30,
                    blurRadius: 20),
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            height: 330,
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  '${widget.coffee.name}',
                  style: GoogleFonts.oswald(fontSize: 30),
                ),
                SizedBox(height: 40),
                GetCartImages(
                  imageNO: widget.coffee.imageUrl,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 40,
              right: 30,
              left: 30,
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 80,
                  child: Text(
                    '${widget.coffee.name}',
                    style: GoogleFonts.oswald(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Color(0xFF2D140D)),
                  ),
                ),
                SizedBox(width: 150),
                Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            countValue == 1 ? countValue = 1 : countValue--;
                          });
                        },
                        child: Image(
                            image: AssetImage('assets/images/minus.png'))),
                    SizedBox(
                        width: 40,
                        child: Center(child: Text('  $countValue  '))),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            countValue++;
                          });
                        },
                        child:
                            Image(image: AssetImage('assets/images/plus.png'))),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            alignment: Alignment.centerLeft,
            child: Text(
              '${widget.coffee.price}\$',
              style: GoogleFonts.oswald(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFCF9775)),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Size',
              style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Color(0xFF2D140D)),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => sizeValue = 0),
                    child: sizeValue == 0
                        ? new Image.asset('assets/images/selectsmallsize.png')
                        : new Image.asset('assets/images/smallsize.png'),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => setState(() => sizeValue = 1),
                    child: sizeValue == 1
                        ? new Image.asset('assets/images/selectmediumsize.png')
                        : new Image.asset('assets/images/mediumsize.png'),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => setState(() => sizeValue = 2),
                    child: sizeValue == 2
                        ? new Image.asset('assets/images/selectlargesize.png')
                        : new Image.asset('assets/images/largesize.png'),
                  ),
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Sugar (in cubes)',
              style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Color(0xFF2D140D)),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => sugarValue = 0),
                    child: sugarValue == 0
                        ? new Image.asset('assets/images/selectnosugar.png')
                        : new Image.asset('assets/images/nosugar.png'),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => setState(() => sugarValue = 1),
                    child: sugarValue == 1
                        ? new Image.asset('assets/images/selectonesugar.png')
                        : new Image.asset('assets/images/onesugar.png'),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => setState(() => sugarValue = 2),
                    child: sugarValue == 2
                        ? new Image.asset('assets/images/selecttwosugar.png')
                        : new Image.asset('assets/images/twosugar.png'),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => setState(() => sugarValue = 3),
                    child: sugarValue == 3
                        ? new Image.asset('assets/images/selectthreesugar.png')
                        : new Image.asset('assets/images/threesugar.png'),
                  ),
                ],
              )),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: mainColor.withOpacity(0.8),
                    blurRadius: 30,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text('Add to cart',
                      style: GoogleFonts.oswald(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  onPressed: () {
                    onAddToCart(context);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
