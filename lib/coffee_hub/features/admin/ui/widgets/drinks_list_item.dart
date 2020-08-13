import 'package:coffee_shop_app/coffee_hub/components/models/coffee_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/ui/widgets/get_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrinksListItem extends StatelessWidget {
  Coffee coffee;
  DrinksListItem({this.coffee});
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 0,
      color: backGroundColor,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: <Widget>[
          GetDrinksImage(imageNO: coffee.imageUrl,),
          Expanded(
              child: ListTile(
            title: Text('${coffee.name}',
                style: GoogleFonts.oswald(
                    color: titleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w200)),
            subtitle: Text('${coffee.price}\$',
                style: GoogleFonts.oswald(
                    color: titleColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
          )),
          Icon(
            Icons.edit,
            color: menuIconColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}
