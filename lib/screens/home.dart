import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/bmi_input.dart';
import 'package:bmi_calculator/widgets/decoration_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculador de índice de massa corporal",
          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: BmiInput(
                    controller: _alturaController,
                    label: "Altura",
                  ),
                ),
                Container(
                  width: 130,
                  child: BmiInput(
                    controller: _pesoController,
                    label: "Peso",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _a = double.parse(_alturaController.text);
                double _p = double.parse(_pesoController.text);
                setState(() {
                  _bmiResult = _p / (_a * _a);
                  if (_bmiResult > 25) {
                    _textResult = "Você esta acima do peso";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "Você tem o peso normal";
                  } else {
                    _textResult = "Você esta abaixo do peso";
                  }
                });
              },
              child: Container(
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult.toString(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            DecorationBar(barWidth: 40 , direction: "left",),
            SizedBox(height: 20),
            DecorationBar(barWidth: 70, direction: "left"),
            SizedBox(height: 20),
            DecorationBar(barWidth: 40, direction: "left"),
            SizedBox(height: 20),
            DecorationBar(barWidth: 70, direction: "right"),
            SizedBox(height: 40),
            DecorationBar(barWidth: 70, direction: "right"),
          ],
        ),
      ),
    );
  }
}
