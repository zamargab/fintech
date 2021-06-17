import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ritech/Config/colors.dart';
import 'package:ritech/morePages/contact.dart';
import 'package:ritech/morePages/faq.dart';
import 'package:ritech/morePages/privacyPolicy.dart';
import 'package:ritech/morePages/roadmap.dart';
import 'package:ritech/morePages/terms.dart';
import 'package:ritech/morePages/transactionHistory.dart';

import 'Config/config.dart';

class More extends StatefulWidget {
  More({Key key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
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
          title: Text(
            "More",
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
          child: Column(
            children: [
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (c) => TermsAndConditions());
                  Navigator.push(context, route);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color(0xFF00AEFF), shape: BoxShape.circle),
                          child: Icon(Icons.gavel, color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Terms and Conditions",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Read our terms and conditions",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF808080),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: SvgPicture.asset("assets/icons/next-n.svg",
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => Faq());
                  Navigator.push(context, route);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color(0xFFFA6E08), shape: BoxShape.circle),
                          child:
                              Icon(Icons.question_answer, color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "FAQ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "FAQ and answers available here",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF808080),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: SvgPicture.asset("assets/icons/next-n.svg",
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => RoadMap());
                  Navigator.push(context, route);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color(0xFFF938FD), shape: BoxShape.circle),
                          child: Icon(Icons.add_road, color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Company Roadmap",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Acquint yourself with our company roadmap",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF808080),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: SvgPicture.asset("assets/icons/next-n.svg",
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (c) => MoreHistory());
                  Navigator.push(context, route);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color(0xFF093D49), shape: BoxShape.circle),
                          child: Icon(Icons.history, color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Transaction History",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "View Catalog of all completed transactions",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF808080),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: SvgPicture.asset("assets/icons/next-n.svg",
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => Contact());
                  Navigator.push(context, route);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color(0xFF1697B6), shape: BoxShape.circle),
                          child: Icon(Icons.contact_mail, color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Contact us",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "View our contact information here",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF808080),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: SvgPicture.asset("assets/icons/next-n.svg",
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => Privacy());
                  Navigator.push(context, route);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Color(0xFF00AEFF),
                                shape: BoxShape.circle),
                            child:
                                Icon(Icons.privacy_tip, color: Colors.white)),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Privacy policy clearly stated",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF808080),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: SvgPicture.asset("assets/icons/next-n.svg",
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
