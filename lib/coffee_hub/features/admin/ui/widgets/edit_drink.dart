import 'package:coffee_shop_app/coffee_hub/components/models/coffee_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/providers/coffee_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditCoffee extends StatefulWidget {
  Coffee coffee;
  EditCoffee({this.coffee});
  @override
  _EditCoffeeState createState() => _EditCoffeeState();
}

class _EditCoffeeState extends State<EditCoffee> {
  GlobalKey<FormState> formKey = GlobalKey();
  
  var imageValue;
  var coffeeName;
  double price;
  
  @override
  void initState() {
    imageValue=widget.coffee.imageUrl;
    coffeeName=widget.coffee.name;
    price=widget.coffee.price;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //imageValue=widget.coffee.imageUrl;
    CoffeeProvider provider = Provider.of<CoffeeProvider>(context, listen: false);
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            initialValue: widget.coffee.name,
            onChanged: (value){
              //provider.setCoffeeName(value);
              coffeeName=value;
              },
            style: GoogleFonts.oswald(),
            validator: (value) {
              if (value.isEmpty) {
                return 'Name Field is required';
              }
            },
            decoration: InputDecoration(
                hintText: 'Enter Name ...', hintStyle: GoogleFonts.oswald()),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            initialValue: widget.coffee.price.toString(),
            onChanged: (value){
              //provider.setCoffeePrice(value);
              price=double.parse(value);
              },
            style: GoogleFonts.oswald(),
            validator: (value) {
              if (value.isEmpty) {
                return 'Price Field is required';
              }
            },
            decoration: InputDecoration(
                hintText: 'Enter Price ...', hintStyle: GoogleFonts.oswald()),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'select image',
            style: GoogleFonts.oswald(
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: Color(0xFF2D140D)),
          ),
          SizedBox(height: 10),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      imageValue = 0;
                      //provider.setCoffeeImage('0');
                      setState(() {
                        
                      });
                    },
                    child: imageValue == 0
                        ? new Image.asset('assets/images/selectEspresso.png',height: 30,)
                        : new Image.asset('assets/images/Espresso.png',height: 30),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      imageValue = 1;
                      //provider.setCoffeeImage('1');
                      setState(() {
                      });
                    },
                    child: imageValue == 1
                        ? new Image.asset('assets/images/selectMocha.png',height: 30)
                        : new Image.asset('assets/images/Mocha.png',height: 30),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      imageValue = 2;
                      //provider.setCoffeeImage('2');
                      setState(() {
                      });
                    },
                    child: imageValue == 2
                        ? new Image.asset('assets/images/selectmacciato.png',height: 30)
                        : new Image.asset('assets/images/macciato.png',height: 30),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      imageValue = 3;
                      //provider.setCoffeeImage('3');
                      setState(() {
                        
                      });
                    },
                    child: imageValue == 3
                        ? new Image.asset('assets/images/selectlatte.png',height: 30)
                        : new Image.asset('assets/images/latte.png',height: 30),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      imageValue = 4;
                      //provider.setCoffeeImage('4');
                      setState(() {
                        
                      });
                    },
                    child: imageValue == 4
                        ? new Image.asset('assets/images/selectCappuccino.png',height: 30)
                        : new Image.asset('assets/images/Cappuccino.png',height: 30),
                  ),
                ],
              )),
              SizedBox(height: 20),
          Center(
              child: RaisedButton.icon(
                  color: mainColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  icon: Icon(
                    Icons.edit,
                    size: 14,
                  ),
                  label: Text(
                    'edit drink',
                    style: GoogleFonts.oswald(),
                  ),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      if (imageValue != null) {
                        widget.coffee.name=coffeeName;
                        widget.coffee.price=price;
                        widget.coffee.imageUrl=imageValue;
                          provider.updateCoffee(widget.coffee);
                        Navigator.pop(context);
                      }
                    } else {
                      return;
                    }
                  })),
        ],
      ),
    );
  }
}