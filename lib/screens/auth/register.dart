import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ritech/Config/colors.dart';
import 'package:ritech/Config/config.dart';
import 'package:ritech/DialogBox/errorDialog.dart';
import 'package:ritech/DialogBox/loadingDialog.dart';
import 'package:ritech/mainscreen.dart';
import 'package:ritech/screens/payments/deposit.dart';
import 'package:ritech/widgets/customTextFields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  final TextEditingController _cPasswordTextEditingController =
      TextEditingController();

  final TextEditingController _phoneNumberTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userImageUrl = "";
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Welcome to Ritech, Create an account and gain access to our platform",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Muli",
                        color: Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFieldNew(
                          controller: _nameTextEditingController,
                          data: Icons.person,
                          hintText: "Name",
                          isObsecure: false,
                        ),
                        CustomTextFieldNew(
                          controller: _emailTextEditingController,
                          data: Icons.email,
                          hintText: "Email",
                          isObsecure: false,
                        ),
                        CustomTextFieldNew(
                          controller: _phoneNumberTextEditingController,
                          data: Icons.email,
                          hintText: "Phone Number",
                          isObsecure: false,
                        ),
                        CustomTextFieldNew(
                          controller: _passwordTextEditingController,
                          data: Icons.person,
                          hintText: "Password",
                          isObsecure: true,
                        ),
                        CustomTextFieldNew(
                          controller: _cPasswordTextEditingController,
                          data: Icons.person,
                          hintText: "Confirm password",
                          isObsecure: true,
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      uploadAndsaveImage();
                    },
                    color: kHomeColor,
                    child: Text(
                      "Signup",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 4.0,
                    width: _screenWidth * 0.8,
                    color: kHomeColor,
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadAndsaveImage() async {
    _passwordTextEditingController.text == _cPasswordTextEditingController.text
        ? _emailTextEditingController.text.isNotEmpty &&
                _passwordTextEditingController.text.isNotEmpty &&
                _cPasswordTextEditingController.text.isNotEmpty &&
                _nameTextEditingController.text.isNotEmpty &&
                _phoneNumberTextEditingController.text.isNotEmpty
            ? uploadToStorage()
            : displayDialog("Please Complete form Appropriately")
        : displayDialog("Password do not match");
  }

  displayDialog(String msg) {
    showDialog(
        context: context,
        builder: (c) {
          return ErrorAlertDialog(
            message: msg,
          );
        });
  }

  uploadToStorage() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(
            message: "Registering, Please wait.....",
          );
        });

    _registerUser();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void _registerUser() async {
    FirebaseUser firebaseUser;
    await _auth
        .createUserWithEmailAndPassword(
            email: _emailTextEditingController.text.trim(),
            password: _passwordTextEditingController.text.trim())
        .then((auth) {
      firebaseUser = auth.user;
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
      saveUserInfoToFirestore(firebaseUser).then((value) {
        Route route = MaterialPageRoute(builder: (c) => IntermediatePage());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future saveUserInfoToFirestore(FirebaseUser fUser) async {
    Firestore.instance.collection("users").document(fUser.uid).setData({
      "uid": fUser.uid,
      "email": fUser.email,
      "name": _nameTextEditingController.text.trim(),
      "phoneNumber": _phoneNumberTextEditingController.text.trim(),
      "Wallet": 0,
      "Invest": 0,
    });

    await RitechApp.sharedPreferences.setString("uid", fUser.uid);
    await RitechApp.sharedPreferences
        .setString(RitechApp.userEmail, fUser.email);
    await RitechApp.sharedPreferences
        .setString(RitechApp.userName, _nameTextEditingController.text);

    await RitechApp.sharedPreferences.setString(
        RitechApp.phoneNumber, _phoneNumberTextEditingController.text);
  }
}
