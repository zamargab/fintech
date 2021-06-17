import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ritech/Config/colors.dart';
import 'package:ritech/Config/config.dart';

class Withdraw extends StatefulWidget {
  Withdraw({Key key}) : super(key: key);

  @override
  _WithdrawState createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  final TextEditingController _withdrawTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenhWidth = MediaQuery.of(context).size.width;
    var screenhHeight = MediaQuery.of(context).size.height;

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
        child: Container(
          child: Container(
            padding: EdgeInsets.all(10),
            width: screenhWidth,
            constraints: BoxConstraints(
              minHeight: screenhHeight * 0.9,
            ),
            decoration: new BoxDecoration(
              color: Color(0xFFeeecec),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    _modalBottomSheetMenu();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color(0xFFFA6E08), shape: BoxShape.circle),
                          child: Icon(
                            CupertinoIcons.plus,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Place withdrawal",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontFamily: "Muli",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: StreamBuilder(
                      stream: Firestore.instance
                          .collection('withdrawal')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.redAccent),
                            ),
                          );
                        }

                        if (snapshot.data.documents.length < 1) {
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(height: 30),
                                Image.asset(
                                  'assets/images/bd2.png',
                                  height: 200,
                                  width:
                                      MediaQuery.of(context).size.width * 0.60,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "No Withdrawal",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontFamily: "Muli",
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: new ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot _card =
                                  snapshot.data.documents[index];

                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 8, 15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF938FD),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            CupertinoIcons.square_stack_3d_up,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "\₦ " +
                                                    _card['amount'].toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Muli",
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF333333),
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                "${RitechApp.timeFormat.format(_card['timeCreated'].toDate())}",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: "Muli",
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF808080),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Text(
                                            "Status: " + _card['status'],
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: "Muli",
                                              color: Color(0xFF808080),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    var screenheight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.7,
                minChildSize: 0.2,
                maxChildSize: 0.90,
                builder: (_, controller) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.grey[600],
                        ),
                        Expanded(
                            child: Container(
                          height: 350.0,
                          color: Colors.transparent,
                          child: new Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Enter required amount below",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF0f1245),
                                        fontFamily: "Muli",
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Theme(
                                    data: new ThemeData(
                                      primaryColor: Color(0xFF0f1245),
                                      primaryColorDark: Color(0xFF0f1245),
                                    ),
                                    child: TextFormField(
                                      controller:
                                          _withdrawTextEditingController,
                                      decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 0),
                                        fillColor: Color(0xFFCC5500),
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(25.0),
                                          borderSide: new BorderSide(width: 2),
                                        ),
                                        //fillColor: Colors.green
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        saveWithdrawRequest();
                                      },
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          color: Color(0xFFFA6E08),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Text(
                                          "Withdraw",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontFamily: "Muli",
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  saveWithdrawRequest() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();
    var document =
        await Firestore.instance.collection('users').document(user.uid).get();
    int withdrawAmount = int.parse(_withdrawTextEditingController.text.trim());

    Firestore.instance.collection("withdrawal").document().setData({
      "createdBy": RitechApp.sharedPreferences.getString(RitechApp.userUID),
      "status": "Pending",
      "amount": withdrawAmount,
      "timeCreated": DateTime.now(),
    }).then((value) {
      double oldWalletValue = document["Wallet"];

      Firestore.instance.collection("users").document(user.uid).updateData({
        "Wallet":
            oldWalletValue - int.parse(_withdrawTextEditingController.text),
      });

      Firestore.instance
          .collection("users")
          .document(RitechApp.sharedPreferences.getString(RitechApp.userUID))
          .collection("transactions")
          .document()
          .setData({
        "uid": user.uid,
        "Email": user.email,
        "Amount": _withdrawTextEditingController.text.toString().trim(),
        "Name": RitechApp.sharedPreferences.getString(RitechApp.userName),
        "Time": DateTime.now(),
        "Value": "Withdrawal",
        "Phone Number":
            RitechApp.sharedPreferences.getString(RitechApp.phoneNumber),
      });

      AwesomeDialog(
        context: context,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        title: '',
        desc: 'Withdrawal request sent',
        btnOkOnPress: () {},
        btnOkIcon: Icons.check_circle,
      )..show();

      _withdrawTextEditingController.clear();
    });
  }
}
