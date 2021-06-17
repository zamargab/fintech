import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  bool isObsecure = true;

  CustomTextField({Key key, this.labelText, this.isObsecure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecure,
      decoration: InputDecoration(
        hasFloatingPlaceholder: false,
        labelText: labelText,
        labelStyle: TextStyle(
            fontFamily: "Muli", fontSize: 16, color: Color(0xFFBDBDBD)),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: BorderSide(
            color: Color(0xFF999999),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: BorderSide(
            color: Color(0xFF999999),
          ),
        ),
      ),
    );
  }
}
