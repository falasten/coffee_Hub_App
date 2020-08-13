import 'package:coffee_shop_app/coffee_hub/components/models/coffee_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/providers/coffee_provider.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/ui/screens/cart_screen.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/ui/widgets/drinks_list_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerDrinksListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Consumer<CoffeeProvider>(
        builder: (context, value, child) {
          List<Coffee> coffees = value.allCoffee;
          if (coffees.isEmpty) {
          return Center(
            child: Text('No Drinks Yet', style: GoogleFonts.oswald(color: mainColor,fontSize: 30),),
          );
        } else {
          return ListView.builder(
            itemCount: coffees.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen(coffee: coffees[index],)));
                },
                child: DrinksListItem(
                  coffee: coffees[index],
                ),
              );
            },
          );
          }
        },
      ),
    );
  }
}
class CustomerDrinksListScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeProvider>(
      builder: (context, CoffeeProvider value, child) {
        return FutureBuilder<List<Coffee>>(
          future: value.getAllCoffees(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<Coffee> coffees = snapshot.data;
                return ListView.builder(
                  itemCount: coffees.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        key: Key(coffees[index].toString()),
                        onDismissed: (direction) {
                          Provider.of<CoffeeProvider>(context,
                                  listen: false)
                              .deleteCoffee(coffees[index].documentId);
                        },
                        child: GestureDetector(
                          onTap: () {
                            
                          },
                          child: DrinksListItem(
                            coffee: coffees[index],
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
    );
  }
}
