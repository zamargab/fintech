import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ritech/Config/colors.dart';
import 'package:ritech/Config/config.dart';

class WalletInvestment extends StatefulWidget {
  WalletInvestment({Key key}) : super(key: key);

  @override
  _WalletInvestmentState createState() => _WalletInvestmentState();
}

class _WalletInvestmentState extends State<WalletInvestment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              StreamBuilder(
                  stream: Firestore.instance
                      .collection('users')
                      .document(RitechApp.sharedPreferences
                          .getString(RitechApp.userUID))
                      .collection("investments")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(kPrimaryColor),
                        ),
                      );
                    }

                    if (snapshot.data.documents.length < 1) {
                      return Center(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/invest2.png",
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.55,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "No Investments",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Muli",
                                  color: Color(0xFF05242C)),
                            ),
                          ],
                        ),
                      );
                    }

                    return new ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot _card =
                            snapshot.data.documents[index];

                        return Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        shape: BoxShape.circle),
                                    child: Icon(Icons.arrow_drop_down),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 8.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                _card['package'] + " Package",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Muli",
                                                  color: Color(0xFF05242C),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "${RitechApp.timeFormat2.format(_card['dateInvest'].toDate())}",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: "Muli",
                                                  color: Color(0xFF808080),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    child: Text(
                                      "₦ " + _card['amount'].toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Muli",
                                        color: Color(0xFF4F4F4F),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(),
                          ],
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
