import 'package:coffee_shop_app/coffee_hub/components/models/coffee_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/providers/coffee_provider.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/ui/widgets/drinks_list_item.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/ui/widgets/edit_drink.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/ui/widgets/insert_drink.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrinksListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Consumer<CoffeeProvider>(
        builder: (context, value, child) {
          List<Coffee> coffees = value.allCoffee;
          if (coffees.isEmpty) {
            return Center(
              child: Text(
                'No Drinks Yet',
                style: GoogleFonts.oswald(color: mainColor, fontSize: 30),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: coffees.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: Key(coffees[index].documentId),
                    onDismissed: (direction) {
                      Provider.of<CoffeeProvider>(context, listen: false)
                          .deleteCoffee(coffees[index].documentId);
                    },
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                                backgroundColor: backGroundColor,
                                title: Text(
                                  "Edit Drink",
                                  style: GoogleFonts.oswald(color: mainColor),
                                ),
                                content: EditCoffee(
                                  coffee: coffees[index],
                                )));
                      },
                      child: DrinksListItem(
                        coffee: coffees[index],
                      ),
                    ));
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          foregroundColor: backGroundColor,
          child: Icon(
            Icons.add,
            size: 35,
          ),
          backgroundColor: mainColor,
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                    backgroundColor: backGroundColor,
                    title: Text(
                      "Add Drink",
                      style: GoogleFonts.oswald(color: mainColor),
                    ),
                    content: InsertCoffee()));
          }),
    );
  }
}
