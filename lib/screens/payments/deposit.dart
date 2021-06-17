import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:ritech/Config/colors.dart';
import 'package:ritech/Config/config.dart';
import 'package:ritech/screens/wallet/phoenixDetails.dart';
import 'package:ritech/screens/wallet/wallet.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();
  final narrationController = TextEditingController();
  final publicKeyController = TextEditingController(
      text: "FLWPUBK_TEST-a66078f37583591f66918c168919a796-X");
  final encryptionKeyController =
      TextEditingController(text: "FLWSECK_TEST512dba327c2d");
  final emailController = TextEditingController(
      text: RitechApp.sharedPreferences.getString(RitechApp.userEmail));
  final phoneNumberController = TextEditingController(
      text: RitechApp.sharedPreferences.getString(RitechApp.phoneNumber));

  String selectedCurrency = "";

  @override
  Widget build(BuildContext context) {
    this.currencyController.text = this.selectedCurrency;
    var screenheight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

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
            "Make Deposit",
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
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                key: this.formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Theme(
                        data: theme.copyWith(primaryColor: Colors.black),
                        child: TextFormField(
                          controller: this.amountController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Amount",
                            labelStyle: theme.textTheme.caption
                                .copyWith(color: theme.primaryColor),
                          ),
                          validator: (value) =>
                              value.isNotEmpty ? null : "Amount is required",
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: RaisedButton(
                        onPressed: this._onPressed,
                        color: kHomeColor,
                        child: Text(
                          "Make Payment",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onPressed() {
    if (this.formKey.currentState.validate()) {
      this._handlePaymentInitialization();
    }
  }

  _handlePaymentInitialization() async {
    final flutterwave = Flutterwave.forUIPayment(
        amount: this.amountController.text.toString().trim(),
        currency: "NGN",
        context: this.context,
        publicKey: this.publicKeyController.text.trim(),
        encryptionKey: this.encryptionKeyController.text.trim(),
        email: this.emailController.text.trim(),
        fullName: "Test User",
        txRef: DateTime.now().toIso8601String(),
        narration: "Example Project",
        isDebugMode: true,
        phoneNumber: this.phoneNumberController.text.trim(),
        acceptAccountPayment: true,
        acceptCardPayment: true,
        acceptUSSDPayment: true);
    final response = await flutterwave.initializeForUiPayments();
    if (response != null) {
      if (response.data.status == "successful") {
        savePaymentInfo();

        AwesomeDialog(
            context: context,
            animType: AnimType.LEFTSLIDE,
            headerAnimationLoop: false,
            dialogType: DialogType.SUCCES,
            title: '',
            desc: response.data.status,
            btnOkOnPress: () {},
            btnOkIcon: Icons.check_circle,
            onDissmissCallback: () {})
          ..show();
      }
    } else {
      this.showLoading("No Response!");
      AwesomeDialog(
        context: context,
        borderSide: BorderSide(color: Colors.green, width: 2),
        width: 380,
        buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: '',
        desc: 'Are you sure you want to make this investment?',
        showCloseIcon: true,
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          Route route = MaterialPageRoute(builder: (c) => Wallet());
          Navigator.push(context, route);
        },
      )..show();
    }
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return this._getCurrency();
        });
  }

  Widget _getCurrency() {
    final currencies = [
      FlutterwaveCurrency.UGX,
      FlutterwaveCurrency.GHS,
      FlutterwaveCurrency.NGN,
      FlutterwaveCurrency.RWF,
      FlutterwaveCurrency.KES,
      FlutterwaveCurrency.XAF,
      FlutterwaveCurrency.XOF,
      FlutterwaveCurrency.ZMW
    ];
    return Container(
      height: 250,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: currencies
            .map((currency) => ListTile(
                  onTap: () => {this._handleCurrencyTap(currency)},
                  title: Column(
                    children: [
                      Text(
                        currency,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 4),
                      Divider(height: 1)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  _handleCurrencyTap(String currency) {
    this.setState(() {
      this.selectedCurrency = currency;
      this.currencyController.text = currency;
    });
    Navigator.pop(this.context);
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: this.context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }

  Future savePaymentInfo() async {
    Firestore.instance
        .collection("users")
        .document(RitechApp.sharedPreferences.getString(RitechApp.userUID))
        .collection("transactions")
        .document()
        .setData({
      "uid": RitechApp.sharedPreferences.getString(RitechApp.userUID),
      "Email": RitechApp.sharedPreferences.getString(RitechApp.userEmail),
      "Amount": amountController.text.toString().trim(),
      "Name": RitechApp.sharedPreferences.getString(RitechApp.userName),
      "Time": DateTime.now(),
      "Value": "Deposit",
      "Phone Number":
          RitechApp.sharedPreferences.getString(RitechApp.phoneNumber),
    });
    print(RitechApp.sharedPreferences.getString(RitechApp.userUID));

    var document = await Firestore.instance
        .collection('users')
        .document(RitechApp.sharedPreferences.getString(RitechApp.userUID))
        .get();
    double walletAmount = document["Wallet"];
    double paid = double.parse(amountController.text);

    Firestore.instance
        .collection("users")
        .document(RitechApp.sharedPreferences.getString(RitechApp.userUID))
        .updateData({
      "Wallet": walletAmount + paid,
    });
  }
}
