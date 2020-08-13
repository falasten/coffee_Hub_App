import 'package:coffee_shop_app/coffee_hub/components/models/user_model.dart';
import 'package:coffee_shop_app/coffee_hub/constants/colors.dart';
import 'package:coffee_shop_app/coffee_hub/features/admin/ui/widgets/update_profile.dart';
import 'package:coffee_shop_app/coffee_hub/services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Consumer<UserProvider>(
          builder: (context, value, child) {
            UserModel userModel = value.currentUser;
             if(userModel==null){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              else {
                return Container(
                  padding: EdgeInsets.all(20),
                  color: backGroundColor,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: mainColor,
                          //child: Image.asset('assets/images/personAvatar.png',width: 80,),
                          child: Icon(
                            Icons.person,
                            size: 45,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('User Name: ${userModel.userName}',
                          style: GoogleFonts.oswald(
                              color: mainColor, fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Email: ${userModel.userEmail}',
                          style: GoogleFonts.oswald(
                              color: mainColor, fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Phone: ${userModel.userPhone??"00000000?"}',
                          style: GoogleFonts.oswald(
                              color: mainColor, fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Address: ${userModel.userAddress??"your address?"}',
                          style: GoogleFonts.oswald(
                              color: mainColor, fontSize: 20)),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        child: Container(
                          width: 200,
                          height: 40,
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
                                'Update',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => new AlertDialog(
                                        backgroundColor: backGroundColor,
                                        title: Text(
                                          "Update Profile",
                                          style: GoogleFonts.oswald(
                                              color: mainColor),
                                        ),
                                        content: UpdateProfile(userModel: userModel,)));
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              } 
    }));
  }
}
