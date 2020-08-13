import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/services/auth_client.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart';

class ForgetPass extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  String email;
  setEmail(value) {
    this.email = value;
  }

  resetPassword() {
    if (!formKey.currentState.validate()) {
      return;
    } else {
      formKey.currentState.save();
      FireAuthHelper.fireAuthHelper.resetPassword(email);
      //     .whenComplete(() async {
      //   bool isLogged = await FireAuthHelper.fireAuthHelper.checkUserLogin();
      //   String isAdmin = await FireAuthHelper.fireAuthHelper.checkAdminLogin();
      //   if (isLogged == true) {
      //     if (isAdmin == 'true') {
      //       Navigator.of(context)
      //           .push(MaterialPageRoute(builder: (context) => HomeScreenBar()));
      //     } else {
      //       Navigator.of(context).push(MaterialPageRoute(
      //           builder: (context) => CustomerHomeScreenBar()));
      //     }
      //   } else {
      //     showDialog(
      //         context: context,
      //         builder: (_) => new AlertDialog(
      //             title: Text(
      //               "Login Error",
      //               style: GoogleFonts.oswald(),
      //             ),
      //             content: Text('Email Or Password is wrong, please try again')));
      //   }
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
                hintStyle: TextStyle(color: mainColor, fontSize: 11),
                prefixIcon: Icon(
                  Icons.email,
                  color: mainColor,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            SizedBox(height: 30),
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
                      'Send',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      resetPassword();
                    }),
              ),
            ),
          ],
        ));
  }
}
