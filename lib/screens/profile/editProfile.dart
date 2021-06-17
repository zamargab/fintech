import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ritech/Config/colors.dart';
import 'package:ritech/Config/config.dart';
import 'package:ritech/widgets/customTextFields.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _editedNameTextEditingController =
      TextEditingController();

  final TextEditingController _editedPhoneNumberTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                        TextFormField(
                          controller: _editedNameTextEditingController,
                          decoration: new InputDecoration(
                            hintText: "Enter name",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            fillColor: Color(0xFFCC5500),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(width: 2),
                            ),
                            //fillColor: Colors.green
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _editedPhoneNumberTextEditingController,
                          decoration: new InputDecoration(
                            hintText: "Enter Phone number",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            fillColor: Color(0xFFCC5500),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(width: 2),
                            ),
                            //fillColor: Colors.green
                          ),
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      saveEdit();
                    },
                    color: kHomeColor,
                    child: Text(
                      "Save Details",
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

  saveEdit() {
    Firestore.instance
        .collection("users")
        .document(RitechApp.sharedPreferences.getString(RitechApp.userUID))
        .updateData({
      "name": _editedNameTextEditingController.text.trim(),
      "phoneNumber": _editedPhoneNumberTextEditingController.text.trim(),
    }).then((value) async {
      await RitechApp.sharedPreferences.setString(
          RitechApp.phoneNumber, _editedPhoneNumberTextEditingController.text);

      await RitechApp.sharedPreferences
          .setString(RitechApp.userName, _editedNameTextEditingController.text);
      _editedPhoneNumberTextEditingController.clear();
      _editedNameTextEditingController.clear();
      AwesomeDialog(
          context: context,
          animType: AnimType.LEFTSLIDE,
          headerAnimationLoop: false,
          dialogType: DialogType.SUCCES,
          title: '',
          desc: 'Saved Succesfully',
          btnOkOnPress: () {},
          btnOkIcon: Icons.check_circle,
          onDissmissCallback: () {})
        ..show();
    });
  }
}
