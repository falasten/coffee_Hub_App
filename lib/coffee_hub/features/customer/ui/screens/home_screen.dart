import 'dart:ui';

import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/ui/tab_screens/all_coffees.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/ui/tab_screens/all_orders.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/ui/tab_screens/map.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/ui/tab_screens/profile.dart';
import 'package:coffee_shop_app/coffee_hub/services/auth_client.dart';
import 'package:coffee_shop_app/coffee_hub/services/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerHomeScreenBar extends StatefulWidget {
  @override
  _CustomerHomeScreenBarState createState() => _CustomerHomeScreenBarState();
}

class _CustomerHomeScreenBarState extends State<CustomerHomeScreenBar>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170.0),
        child: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/images/Menu.png'),
            alignment: Alignment.centerLeft,
          ),
          backgroundColor: backGroundColor,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                scaffoldKey.currentState.openDrawer();
              },
              child: Image(image: AssetImage('assets/images/drawerIcon.png'))),
          actions: <Widget>[
            GestureDetector(
                onTap: () {
                  FireAuthHelper.fireAuthHelper.signOutFromDevice();
                  Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) =>
                              route ==
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                },
                child: Icon(
                  Icons.exit_to_app,
                  color: mainColor,
                  size: 30,
                ))
          ],
        ),
      ),
      backgroundColor: backGroundColor,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              maxRadius: 45,
              backgroundColor: mainColor,
              //child: Image.asset('assets/images/personAvatar.png',width: 80,),
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('userName',
                style: GoogleFonts.oswald(color: mainColor, fontSize: 20)),
            SizedBox(
              height: 10,
            ),
            Text('admin@gmail.com',
                style: GoogleFonts.oswald(color: mainColor, fontSize: 20)),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CustomerHomeScreenBar()));
                    },
                    child: Text(
                      'HOME',
                      style: TextStyle(
                          color: secondColor, fontWeight: FontWeight.bold),
                    ))),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Center(
                child: GestureDetector(
                    onTap: () {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      // builder: (context) => CustomerHomeScreenBar()));
                    },
                    child: Text(
                      'MESSAGES',
                      style: TextStyle(
                          color: secondColor, fontWeight: FontWeight.bold),
                    ))),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Center(
                child: GestureDetector(
                    onTap: () {
                      FireAuthHelper.fireAuthHelper.signOutFromDevice();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) =>
                              route ==
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'SIGN OUT',
                      style: TextStyle(
                          color: secondColor, fontWeight: FontWeight.bold),
                    ))),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            CustomerDrinksListScreen(),
            MapScreen(),
            CartListScreen(),
            ProfileScreen()
          ]),
    );
  }

  Widget get bottomNavigationBar {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), topLeft: Radius.circular(50)),
        boxShadow: [
          BoxShadow(color: Color(0xFFFFDE9DA), spreadRadius: 0, blurRadius: 20),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            index = value;
            _tabController.animateTo(value);
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: index == 0
                    ? new Image.asset('assets/images/selecthome.png')
                    : new Image.asset('assets/images/home.png'),
                title: Container()),
            BottomNavigationBarItem(
                icon: index == 1
                    ? new Image.asset('assets/images/selectlocate.png')
                    : new Image.asset('assets/images/locate.png'),
                title: Container()),
            BottomNavigationBarItem(
                icon: index == 2
                    ? new Image.asset('assets/images/selectcart.png')
                    : new Image.asset('assets/images/cart.png'),
                title: Container()),
            BottomNavigationBarItem(
                icon: index == 3
                    ? new Image.asset('assets/images/selectprofile.png')
                    : new Image.asset('assets/images/profile.png'),
                title: Container()),
          ],
        ),
      ),
    );
  }
}
