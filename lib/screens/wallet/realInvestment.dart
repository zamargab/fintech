import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ritech/Config/colors.dart';
import 'package:ritech/Config/config.dart';
import 'package:ritech/screens/wallet/eagleDetails.dart';
import 'package:ritech/screens/wallet/phoenixDetails.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:ritech/screens/wallet/sparrowDetails.dart';

class RealInvestment extends StatefulWidget {
  RealInvestment({Key key}) : super(key: key);

  @override
  _RealInvestmentState createState() => _RealInvestmentState();
}

class _RealInvestmentState extends State<RealInvestment> {
  @override
  Widget build(BuildContext context) {
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
            "Investment",
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 200,
                ),
                decoration: new BoxDecoration(
                  color: kHomeColor,
                  border: Border.all(color: kPrimaryColor, width: 4),
                  borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            child: Image.asset(
                              "assets/images/rlogo.png",
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Investment",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Muli",
                                        color: Colors.white),
                                  ),
                                  InkWell(
                                    child: Center(
                                      child: Container(
                                        child: FutureBuilder<DocumentSnapshot>(
                                          future: Firestore.instance
                                              .collection("users")
                                              .document(RitechApp
                                                  .sharedPreferences
                                                  .getString(RitechApp.userUID))
                                              .get(),
                                          builder: (c, snapshot) {
                                            if (!snapshot.hasData)
                                              return Center(
                                                child: CircularProgressIndicator(
                                                    valueColor:
                                                        new AlwaysStoppedAnimation<
                                                                Color>(
                                                            kPrimaryColor)),
                                              );
                                            else {
                                              return Text(
                                                "\₦ " +
                                                    snapshot.data.data["Invest"]
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Muli",
                                                    fontWeight: FontWeight.bold,
                                                    color: kPrimaryColor),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Wallet",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Muli",
                                        color: Colors.white),
                                  ),
                                  InkWell(
                                    child: Center(
                                      child: Container(
                                        child: FutureBuilder<DocumentSnapshot>(
                                          future: Firestore.instance
                                              .collection("users")
                                              .document(RitechApp
                                                  .sharedPreferences
                                                  .getString(RitechApp.userUID))
                                              .get(),
                                          builder: (c, snapshot) {
                                            if (!snapshot.hasData)
                                              return Center(
                                                child: CircularProgressIndicator(
                                                    valueColor:
                                                        new AlwaysStoppedAnimation<
                                                                Color>(
                                                            kPrimaryColor)),
                                              );
                                            else {
                                              return Text(
                                                "\₦ " +
                                                    snapshot.data.data["Wallet"]
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Muli",
                                                    fontWeight: FontWeight.bold,
                                                    color: kPrimaryColor),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Investment Packages",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Muli",
                            color: kHomeColor),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        ClipPath(
                          clipper: MovieTicketClipper(),
                          child: Container(
                            height: 100,
                            color: kHomeColor,
                            child: Center(
                                child: Text(
                              "Phoenix Package",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(width: 1.0, color: kHomeColor),
                                right:
                                    BorderSide(width: 1.0, color: kHomeColor),
                              ),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Text(
                                "15% Monthly",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Minimum Deposit",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              Text(
                                "₦ 36,000",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Maximun Deposit",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              Text(
                                "₦ 360,000",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Withdrawal Instant",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        ClipPath(
                          clipper: WaveClipperTwo(),
                          child: Container(
                            height: 120,
                            color: kHomeColor,
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 30),
                                child: AnimatedButton(
                                  color: kPrimaryColor,
                                  width: 100,
                                  text: 'Get Started',
                                  buttonTextStyle:
                                      TextStyle(color: Colors.black),
                                  pressEvent: () {
                                    AwesomeDialog(
                                      context: context,
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 2),
                                      width: 380,
                                      buttonsBorderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      headerAnimationLoop: false,
                                      animType: AnimType.BOTTOMSLIDE,
                                      title: '',
                                      desc:
                                          'Proceed to fill-out investement form?',
                                      showCloseIcon: true,
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {
                                        Route route = MaterialPageRoute(
                                            builder: (c) => PhoenixDetails());
                                        Navigator.push(context, route);
                                      },
                                    )..show();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        ClipPath(
                          clipper: MovieTicketClipper(),
                          child: Container(
                            height: 100,
                            color: kHomeColor,
                            child: Center(
                                child: Text(
                              "Sparrow Package",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(width: 1.0, color: kHomeColor),
                                right:
                                    BorderSide(width: 1.0, color: kHomeColor),
                              ),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Text(
                                "15% Monthly",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Minimum Deposit",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              Text(
                                "₦ 360,000",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Maximun Deposit",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              Text(
                                "₦ 750,000",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Withdrawal Instant",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        ClipPath(
                          clipper: WaveClipperTwo(),
                          child: Container(
                            height: 120,
                            color: kHomeColor,
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 30),
                                child: AnimatedButton(
                                  color: kPrimaryColor,
                                  width: 100,
                                  text: 'Get Started',
                                  buttonTextStyle:
                                      TextStyle(color: Colors.black),
                                  pressEvent: () {
                                    AwesomeDialog(
                                      context: context,
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 2),
                                      width: 380,
                                      buttonsBorderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      headerAnimationLoop: false,
                                      animType: AnimType.BOTTOMSLIDE,
                                      title: '',
                                      desc:
                                          'Proceed to fill-out investement form?',
                                      showCloseIcon: true,
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {
                                        Route route = MaterialPageRoute(
                                            builder: (c) => SparrowDetails());
                                        Navigator.push(context, route);
                                      },
                                    )..show();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        ClipPath(
                          clipper: MovieTicketClipper(),
                          child: Container(
                            height: 100,
                            color: kHomeColor,
                            child: Center(
                                child: Text(
                              "Eagle Package",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(width: 1.0, color: kHomeColor),
                                right:
                                    BorderSide(width: 1.0, color: kHomeColor),
                              ),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Text(
                                "15% Monthly",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Minimum Deposit",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              Text(
                                "₦ 750,000",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Maximun Deposit",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              Text(
                                "₦ 1,500,000",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Withdrawal Instant",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Muli",
                                    color: kHomeColor),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        ClipPath(
                          clipper: WaveClipperTwo(),
                          child: Container(
                            height: 120,
                            color: kHomeColor,
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 30),
                                child: AnimatedButton(
                                  color: kPrimaryColor,
                                  width: 100,
                                  text: 'Get Started',
                                  buttonTextStyle:
                                      TextStyle(color: Colors.black),
                                  pressEvent: () {
                                    AwesomeDialog(
                                      context: context,
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 2),
                                      width: 380,
                                      buttonsBorderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      headerAnimationLoop: false,
                                      animType: AnimType.BOTTOMSLIDE,
                                      title: '',
                                      desc:
                                          'Proceed to fill-out investement form?',
                                      showCloseIcon: true,
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {
                                        Route route = MaterialPageRoute(
                                            builder: (c) => EagleDetails());
                                        Navigator.push(context, route);
                                      },
                                    )..show();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
