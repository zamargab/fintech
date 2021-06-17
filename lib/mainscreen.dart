import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ritech/more.dart';
import 'package:ritech/screens/home.dart';
import 'package:ritech/screens/profile/profile.dart';
import 'package:ritech/screens/wallet/investment.dart';
import 'package:ritech/screens/wallet/realInvestment.dart';
import 'package:ritech/screens/wallet/wallet.dart';

import 'Config/colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Wallet(),
    RealInvestment(),
    Profile(),
    More()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedLabelStyle: TextStyle(fontSize: 10),
        selectedItemColor: kHomeColor,
        unselectedLabelStyle: TextStyle(fontSize: 10),
        unselectedItemColor: kPrimaryColor,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.home, color: kHomeColor),
            ),
            label: "Home",
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.home, color: kHomeColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.wallet_giftcard, color: kHomeColor),
            ),
            label: "Wallet",
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.wallet_giftcard, color: kHomeColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.bar_chart, color: kHomeColor),
            ),
            label: "Investment",
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.bar_chart, color: kHomeColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.person, color: kHomeColor),
            ),
            label: "Profile",
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.person, color: kHomeColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                "assets/icons/more.svg",
                color: kHomeColor,
              ),
            ),
            label: "More",
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                "assets/icons/more.svg",
                color: kHomeColor,
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
