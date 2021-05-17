import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';

class BmiInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const BmiInput({Key key, this.controller, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w300,
        color: accentHexColor,
      ),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: label,
        hintStyle: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w300,
          color: Colors.white.withOpacity(.8),
        ),
      ),
    );
  }
}
