import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: Image.asset("assets/images/CoffeeHub.png"))
      ),
      
    );
  }

}