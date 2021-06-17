import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ritech/Config/colors.dart';
import 'package:ritech/Config/config.dart';
import 'package:ritech/morePages/contact.dart';
import 'package:ritech/screens/auth/login.dart';
import 'package:ritech/screens/profile/editProfile.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
              child: Container(
                color: Color(0xFF0F2F2F2),
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          leading: Container(
            height: 3,
            width: 3,
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.fromLTRB(20, 2, 0, 2),
            decoration:
                BoxDecoration(color: kHomeColor, shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/back-n.svg",
                  color: kPrimaryColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Muli",
              fontWeight: FontWeight.w800,
              color: Color(0xFF05242C),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: _screenHeight * 0.30,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                  child: Container(
                    height: 250.0,
                    child: Image.asset(
                      "assets/images/pro3.png",
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              RitechApp.sharedPreferences.getString(RitechApp.userName),
              style: TextStyle(
                  fontSize: 25, fontFamily: "Muli", color: kHomeColor),
            ),
            SizedBox(height: 10),
            Container(
              constraints: BoxConstraints(minHeight: _screenHeight * 0.15),
              color: kHomeColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.transparent,
                          shape: BoxShape.circle),
                      child: Icon(Icons.phone, color: Colors.white),
                    ),
                    Container(
                      height: 65,
                      width: 65,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.transparent,
                          shape: BoxShape.circle),
                      child: Icon(Icons.forum, color: Colors.white),
                    ),
                    Container(
                      height: 65,
                      width: 65,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.transparent,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 65,
                      width: 65,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.transparent,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
            Table(
              border: TableBorder.all(color: Colors.grey),
              children: [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        12, _screenHeight * 0.03, 12, _screenHeight * 0.03),
                    child: Row(
                      children: [
                        Icon(Icons.email, color: kHomeColor),
                        SizedBox(width: 5),
                        Text(
                          RitechApp.sharedPreferences
                              .getString(RitechApp.userEmail),
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Muli",
                              color: kHomeColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.phone, color: kHomeColor),
                        SizedBox(width: 5),
                        Text(
                          RitechApp.sharedPreferences
                              .getString(RitechApp.phoneNumber),
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Muli",
                              color: kHomeColor),
                        ),
                      ],
                    ),
                  ),
                ]),
                TableRow(children: [
                  InkWell(
                    onTap: () {
                      RitechApp.auth.signOut().then((c) {
                        Route route =
                            MaterialPageRoute(builder: (c) => Login());
                        Navigator.push(context, route);
                        AwesomeDialog(
                            context: context,
                            animType: AnimType.LEFTSLIDE,
                            headerAnimationLoop: false,
                            dialogType: DialogType.SUCCES,
                            title: '',
                            desc: 'Logged out',
                            btnOkOnPress: () {},
                            btnOkIcon: Icons.check_circle,
                            onDissmissCallback: () {})
                          ..show();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          12, _screenHeight * 0.03, 12, _screenHeight * 0.03),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.tray_arrow_up,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Muli",
                                color: kHomeColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Route route =
                          MaterialPageRoute(builder: (c) => Contact());
                      Navigator.push(context, route);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.chat_bubble_2_fill,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Support",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Muli",
                                color: kHomeColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 20),
                    Text(
                      "Edit your profile",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Muli",
                      ),
                    ),
                    SizedBox(width: 35),
                    FlatButton(
                      child: Text(
                        "Click here",
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        Route route =
                            MaterialPageRoute(builder: (c) => EditProfile());
                        Navigator.push(context, route);
                      },
                      color: kSplashColor,
                      textColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
