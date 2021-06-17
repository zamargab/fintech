import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ritech/Config/colors.dart';
import 'package:ritech/Config/config.dart';
import 'package:ritech/DialogBox/errorDialog.dart';
import 'package:ritech/DialogBox/loadingDialog.dart';
import 'package:ritech/mainscreen.dart';
import 'package:ritech/screens/auth/register.dart';
import 'package:ritech/widgets/auth_textFormField.dart';
import 'package:ritech/widgets/customTextFields.dart';

import '../home.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    "assets/images/rlogo.png",
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Ritech",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Muli",
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF05242C),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Email address",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Muli",
                      color: Color(0xFF4F4F4F),
                    ),
                  ),
                ),
                CustomTextFieldNew(
                  hintText: "Email address",
                  isObsecure: false,
                  controller: _emailTextEditingController,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Muli",
                      color: Color(0xFF4F4F4F),
                    ),
                  ),
                ),
                CustomTextFieldNew(
                  hintText: "Password",
                  isObsecure: true,
                  controller: _passwordTextEditingController,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                        value: remember,
                        activeColor: Color(0xFF1AB6DC),
                        onChanged: (value) {
                          setState(() {
                            remember = value;
                          });
                        }),
                    Text(
                      "Remeber Me",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Muli",
                        color: Color(0xFF4F4F4F),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => {},
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Muli",
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17),
                Container(
                  height: 60,
                  margin: EdgeInsets.fromLTRB(0, 23, 0, 28),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      loginUser();
                    },
                    color: kSplashColor,
                    textColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Don't Have an account?",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Muli",
                        color: Color(0xFF4F4F4F),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Route route =
                            MaterialPageRoute(builder: (c) => Register());
                        Navigator.push(context, route);
                      },
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Muli",
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void loginUser() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(
            message: "Authenticating, Please wait.....",
          );
        });
    FirebaseUser firebaseUser;
    await _auth
        .signInWithEmailAndPassword(
      email: _emailTextEditingController.text.trim(),
      password: _passwordTextEditingController.text.trim(),
    )
        .then((authUser) {
      firebaseUser = authUser.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
    });

    if (firebaseUser != null) {
      readData(firebaseUser).then((s) {
        Route route = MaterialPageRoute(builder: (c) => IntermediatePage());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future readData(FirebaseUser fUser) async {
    Firestore.instance
        .collection("users")
        .document(fUser.uid)
        .get()
        .then((dataSnapshot) async {
      await RitechApp.sharedPreferences
          .setString("uid", dataSnapshot.data[RitechApp.userUID]);

      await RitechApp.sharedPreferences.setString(
          RitechApp.userEmail, dataSnapshot.data[RitechApp.userEmail]);

      await RitechApp.sharedPreferences
          .setString(RitechApp.phoneNumber, dataSnapshot.data["phoneNumber"]);

      await RitechApp.sharedPreferences
          .setString(RitechApp.userName, dataSnapshot.data[RitechApp.userName]);
    });
  }
}
