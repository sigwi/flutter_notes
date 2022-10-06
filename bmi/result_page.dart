import 'package:bmi_app/constants.dart';
import 'package:bmi_app/reusable_card.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(this.BMIresult, this.interpretation, this.resultText);

  final String BMIresult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kResultTitleText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reusableCard(
              kInactiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    BMIresult,
                    style: kResultNumberStyle,
                  ),
                  Text(interpretation)
                ],
              ),
              () {},
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: const Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kNumberTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
