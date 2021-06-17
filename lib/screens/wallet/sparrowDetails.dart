import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ritech/Config/colors.dart';
import 'package:ritech/Config/config.dart';
import 'package:ritech/screens/wallet/realInvestment.dart';
import 'package:uuid/uuid.dart';

class SparrowDetails extends StatefulWidget {
  SparrowDetails({Key key}) : super(key: key);

  @override
  _SparrowDetailsState createState() => _SparrowDetailsState();
}

class _SparrowDetailsState extends State<SparrowDetails> {
  final TextEditingController _investAmountTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
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
            "Make Investment",
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
                  border: Border.all(color: kHomeColor, width: 4),
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
                            child: Image.asset(
                          "assets/images/bd3.png",
                          height: screenheight * 0.3,
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                    child: TextFormField(
                      controller: _investAmountTextEditingController,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        hasFloatingPlaceholder: false,
                        labelText: "Enter Amount",
                        labelStyle: TextStyle(
                            fontFamily: "Muli",
                            fontSize: 16,
                            color: Color(0xFFBDBDBD)),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color(0xFF999999),
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: AnimatedButton(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: kHomeColor,
                  text: 'Make Investment',
                  buttonTextStyle: TextStyle(color: kPrimaryColor),
                  pressEvent: () {
                    AwesomeDialog(
                      context: context,
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      width: 380,
                      headerAnimationLoop: false,
                      animType: AnimType.BOTTOMSLIDE,
                      title: '',
                      desc: 'Are you sure you want to make this investment?',
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        saveInvestmentInfo();
                      },
                    )..show();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future saveInvestmentInfo() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();
    var document =
        await Firestore.instance.collection('users').document(user.uid).get();

    int investedInt = int.parse(_investAmountTextEditingController.text.trim());

    if (int.parse(_investAmountTextEditingController.text) <=
        document["Wallet"]) {
      var uuid = Uuid();
      String docID = uuid.v1();
      Firestore.instance
          .collection("users")
          .document(RitechApp.sharedPreferences.getString(RitechApp.userUID))
          .collection("investments")
          .document(docID)
          .setData({
        "uid": RitechApp.sharedPreferences.getString(RitechApp.userUID),
        "amount": investedInt,
        "dateInvest": DateTime.now(),
        "package": "Sparrow",
        "dateMaturity":
            DateTime.now().add(Duration(days: 0, hours: 0, minutes: 2)),
        "docID": docID,
        "status": "0"
      }).then((value) {
        Firestore.instance.collection("users").document(user.uid).updateData({
          "Wallet": document["Wallet"] -
              int.parse(_investAmountTextEditingController.text),
        });

        int oldInvestValue = document["Invest"];
        Firestore.instance.collection("users").document(user.uid).updateData({
          "Invest": oldInvestValue +
              int.parse(_investAmountTextEditingController.text),
        });
        _investAmountTextEditingController.clear();
        Route route = MaterialPageRoute(builder: (c) => RealInvestment());
        Navigator.push(context, route);
        AwesomeDialog(
            context: context,
            animType: AnimType.LEFTSLIDE,
            headerAnimationLoop: false,
            dialogType: DialogType.SUCCES,
            title: 'Succes',
            desc: 'Investment has been made!',
            btnOkOnPress: () {
              debugPrint('OnClcik');
            },
            btnOkIcon: Icons.check_circle,
            onDissmissCallback: () {
              debugPrint('Dialog Dissmiss from callback');
            })
          ..show();
      });
    } else {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: false,
          title: 'Error',
          desc: 'Not Enough Funds',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red)
        ..show();
    }
  }
}
