import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/ui/screens/home_screen.dart';
import 'package:coffee_shop_app/coffee_hub/features/customer/ui/screens/home_screen.dart';
import 'package:coffee_shop_app/coffee_hub/services/auth_client.dart';
import 'package:coffee_shop_app/coffee_hub/services/forget_password.dart';
import 'package:coffee_shop_app/coffee_hub/services/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  String email;
  String password;
  setEmail(value) {
    this.email = value;
  }

  setPassword(value) {
    this.password = value;
  }

  loginByEmailAndPassword(BuildContext context) {
    if (!formKey.currentState.validate()) {
      return;
    } else {
      formKey.currentState.save();
      FireAuthHelper.fireAuthHelper
          .loginByEmailAndPassword(email, password)
          .whenComplete(() async {
        bool isLogged = await FireAuthHelper.fireAuthHelper.checkUserLogin();
        String isAdmin = await FireAuthHelper.fireAuthHelper.checkAdminLogin();
        if (isLogged == true) {
          if (isAdmin == 'true') {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreenBar()));
          } else {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CustomerHomeScreenBar()));
          }
        } else {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                  title: Text(
                    "Login Error",
                    style: GoogleFonts.oswald(),
                  ),
                  content: Text('Email Or Password is wrong, please try again')));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Image(
                  image: AssetImage('assets/images/login.png'),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 70),
                        TextFormField(
                          onSaved: (newValue) => this.setEmail(newValue),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'you can\'t enter empty email';
                            } else if (!isEmail(value)) {
                              return 'please enter a correct email address';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            hintStyle:
                                TextStyle(color: mainColor, fontSize: 11),
                            prefixIcon: Icon(
                              Icons.email,
                              color: mainColor,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: mainColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: mainColor)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red)),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          onSaved: (newValue) => this.setPassword(newValue),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'you can\'t enter empty password';
                            } else if (value.length <= 6) {
                              return 'password length must be larger than 6';
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            hintStyle:
                                TextStyle(color: mainColor, fontSize: 11),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: mainColor,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: mainColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: mainColor)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => new AlertDialog(
                                      backgroundColor: backGroundColor,
                                      title: Text(
                                        "Forget Password",
                                        style: GoogleFonts.oswald(),
                                      ),
                                      content: ForgetPass()));
                            },
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: secondColor,
                              ),
                            )),
                        SizedBox(height: 50),
                        SizedBox(
                          width: double.infinity,
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
                                color: mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  loginByEmailAndPassword(context);
                                  //FireAuthHelper.fireAuthHelper.signOutFromDevice();
                                }),
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: Text('SOCIAL LOGIN'),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/Facebook.png'),
                              backgroundColor: Colors.transparent,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/twitter.png'),
                              backgroundColor: Colors.transparent,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/Google Plus.png'),
                              backgroundColor: Colors.transparent,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          'New User?',
                          style: TextStyle(color: mainColor),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                                },
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                      color: secondColor,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ],
                    ))
              ],
            ),
          )),
    ));
  }
}
