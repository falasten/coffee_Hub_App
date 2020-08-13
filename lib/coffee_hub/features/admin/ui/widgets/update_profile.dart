import 'package:coffee_shop_app/coffee_hub/components/models/user_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class UpdateProfile extends StatefulWidget {
  UserModel userModel;
  UpdateProfile({this.userModel});

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  GlobalKey<FormState> formKey = GlobalKey();

var userName;

var userEmail;

var userPhone;

var userAddress;

@override
  void initState() {
    userName = widget.userModel.userName ?? '';
    userEmail = widget.userModel.userEmail ?? '';
    userPhone = widget.userModel.userPhone ?? '';
    userAddress = widget.userModel.userAddress ?? '';
    super.initState();
  }
  void updateUser(BuildContext context) {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      widget.userModel.userName=userName;
    widget.userModel.userEmail=userEmail;
    widget.userModel.userPhone=userPhone;
    widget.userModel.userAddress=userAddress;
    Provider.of<UserProvider>(context, listen: false).updateUser(widget.userModel);
    Navigator.pop(context);
    }
    else{
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            onChanged: (value) {
              userName=value;
            },
            initialValue: userName,
            style: GoogleFonts.oswald(),
            validator: (value) {
              if (value.isEmpty) {
                return 'you can\'t enter empty Name';
              }
            },
            decoration: InputDecoration(
                hintText: 'Enter Name ...', hintStyle: GoogleFonts.oswald()),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              userEmail=value;
            },
            initialValue: userEmail,
            style: GoogleFonts.oswald(),
            validator: (value) {
              if (value.isEmpty) {
                return 'you can\'t enter empty email';
              } else if (!isEmail(value)) {
                return 'please enter a correct email address';
              }
            },
            decoration: InputDecoration(
                hintText: 'Enter Email ...', hintStyle: GoogleFonts.oswald()),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: (value) {
              userPhone=value;
            },
            initialValue: userPhone,
            style: GoogleFonts.oswald(),
            validator: (value) {
              if (value.isEmpty) {
                return 'you can\'t enter empty phone';
              } 
            },
            decoration: InputDecoration(
                hintText: 'Enter Phone ...', hintStyle: GoogleFonts.oswald()),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: (value) {
              userAddress=value;
            },
            initialValue: userAddress,
            style: GoogleFonts.oswald(),
            validator: (value) {
              if (value.isEmpty) {
                return 'you can\'t enter empty address';
              }
            },
            decoration: InputDecoration(
                hintText: 'Enter Address ...', hintStyle: GoogleFonts.oswald()),
          ),
          SizedBox(
            height: 10,
          ),
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
                    'update',
                    style: GoogleFonts.oswald(),
                  ),
                  onPressed: () {
                    updateUser(context);
                  })),
        ],
      ),
    );
  }
}
