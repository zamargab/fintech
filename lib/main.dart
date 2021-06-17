import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ritech/Onboarding/body.dart';
import 'package:ritech/mainscreen.dart';
import 'package:ritech/screens/auth/login.dart';
import 'package:ritech/screens/home.dart';
import 'package:ritech/screens/payments/deposit.dart';
import 'package:ritech/screens/profile/profile.dart';
import 'package:ritech/morePages/terms.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'Config/colors.dart';
import 'Config/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RitechApp.auth = FirebaseAuth.instance;
  RitechApp.sharedPreferences = await SharedPreferences.getInstance();
  RitechApp.firestore = Firestore.instance;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AMO Mentorship',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    displaySplash();
  }

  displaySplash() {
    Timer(Duration(seconds: 5), () async {
      if (await RitechApp.auth.currentUser() != null) {
        Stream<QuerySnapshot> productRef = RitechApp.firestore
            .collection(RitechApp.collectionUser)
            .document(RitechApp.sharedPreferences.getString(RitechApp.userUID))
            .collection("investments")
            .snapshots();

        productRef.forEach((field) {
          field.documents.asMap().forEach((index, data) async {
            var format = new DateFormat('yyyy-MM-d kk:mm:ss');

            bool dateChecker = DateTime.now().isAfter(DateTime.parse(format
                .format(DateTime.parse(field.documents[index]["dateMaturity"]
                    .toDate()
                    .toString()))));
            print(dateChecker);

            if (dateChecker && field.documents[index]["status"] != "matured") {
              RitechApp.firestore
                  .collection(RitechApp.collectionUser)
                  .document(
                      RitechApp.sharedPreferences.getString(RitechApp.userUID))
                  .collection("investments")
                  .document(field.documents[index]["docID"])
                  .updateData({
                "status": "matured",
              });

              int investedAmount = field.documents[index]["amount"];
              double roi = (15 / 100) * investedAmount;
              final FirebaseAuth _auth = FirebaseAuth.instance;
              FirebaseUser user = await _auth.currentUser();
              var document = await Firestore.instance
                  .collection('users')
                  .document(user.uid)
                  .get();

              var oldWalletValue = document["Wallet"];
              var oldInvestValue = document["Invest"];
              RitechApp.firestore
                  .collection(RitechApp.collectionUser)
                  .document(
                      RitechApp.sharedPreferences.getString(RitechApp.userUID))
                  .updateData({
                "Wallet": oldWalletValue + roi + investedAmount,
              });

              RitechApp.firestore
                  .collection(RitechApp.collectionUser)
                  .document(
                      RitechApp.sharedPreferences.getString(RitechApp.userUID))
                  .updateData({
                "Invest": oldInvestValue - investedAmount,
              });
            }
          });
        });

        Route route = MaterialPageRoute(builder: (_) => MainScreen());
        Navigator.pushReplacement(context, route);
      } else {
        Route route = MaterialPageRoute(builder: (_) => Onbording());
        Navigator.pushReplacement(context, route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [kSplashColor, kSplashColor],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/rlogo.png",
                height: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
