import 'package:coffee_shop_app/coffee_hub/components/models/user_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/services/auth_client.dart';
import 'package:coffee_shop_app/coffee_hub/services/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController pass = TextEditingController();
  // final Size s;
  // RegisterScreen({this.s});
  String name;
  String email;
  String password;
  setName(value) {
    this.name = value;
  }

  setEmail(value) {
    this.email = value;
  }

  setPassword(value) {
    this.password = value;
  }

  registeringByEmailAndPassword(BuildContext context) {
    if (!formKey.currentState.validate()) {
      return;
    } else {
      formKey.currentState.save();
      UserModel userModel = UserModel(
          userName: name, userEmail: email, isAdmin: false, password: password);
      FireAuthHelper.fireAuthHelper
          .registerByEmailAndPassword(userModel)
          .whenComplete(() async {
        String isDone = await FireAuthHelper.fireAuthHelper.checkRegister();
        if (isDone == 'true') {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        } else {
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                  title: Text(
                    "Register Error",
                    style: GoogleFonts.oswald(),
                  ),
                  content: Text('This email is already exist')));
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
                    image: AssetImage('assets/images/register.png'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            onSaved: (newValue) => this.setName(newValue),
                            //controller: name,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'please enter name';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Name',
                              hintStyle:
                                  TextStyle(color: mainColor, fontSize: 11),
                              prefixIcon: Icon(
                                Icons.person,
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
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
                          SizedBox(height: 15),
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
                            controller: pass,
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
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            //controller: confirmPass,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'you can\'t enter empty password';
                              } else if (value.length <= 6) {
                                return 'password length must be larger than 6';
                              } else if (value != pass.text) {
                                return 'password not match';
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
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
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
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
                                    'Register',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    registeringByEmailAndPassword(context);
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
                              GestureDetector(
                                onTap: (){
                                  //FireAuthHelper.fireAuthHelper.loginUsingGmail();
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      'assets/images/Google Plus.png'),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            'Already have an account?',
                            style: TextStyle(color: mainColor),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              'LOGIN NOW',
                              style: TextStyle(
                                  color: secondColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                        ],
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
