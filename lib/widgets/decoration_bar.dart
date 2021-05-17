import 'dart:html';

import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';

class DecorationBar extends StatelessWidget {
  final double barWidth;
  final String direction;
  const DecorationBar({Key key, @required this.barWidth, @required this.direction}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: direction == 'left' ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: setDirection(),
        ),
      ],
    );
  }
  setDirection(){
    if(direction == 'left'){
      return BoxDecoration(
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: accentHexColor,);
    }else{
     return BoxDecoration(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: accentHexColor,);
    }
  }
}