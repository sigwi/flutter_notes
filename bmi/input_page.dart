import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculation_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  //fungsi gesture
  // void updateColor(Gender selectedGender) {
  // if (selectedGender == Gender.male) {
  //   if (maleCardColor == inactiveCardColor) {
  //     maleCardColor = activeCardColor;
  //     femaleCardColor = inactiveCardColor;
  //   } else {
  //     maleCardColor = inactiveCardColor;
  //   }
  // }
  // if (selectedGender == Gender.female) {
  //   if (femaleCardColor == inactiveCardColor) {
  //     femaleCardColor = activeCardColor;
  //     maleCardColor = inactiveCardColor;
  //   } else {
  //     femaleCardColor = inactiveCardColor;
  //   }
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: reusableCard(
                      //maleCardColor
                      selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      IconContent(FontAwesomeIcons.person, 'MALE'),
                      () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: reusableCard(
                      // femaleCardColor,
                      selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      IconContent(FontAwesomeIcons.personDress, 'FEMALE'),
                      () {
                        setState(() {
                          selectedGender == Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            //Slider Widget
            Expanded(
              child: reusableCard(
                //colour
                kInactiveCardColor,
                //cardChild
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text(
                          ' cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    //onPress
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.pink,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 10,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 10,
                        ),
                        trackHeight: 1,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 200,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                () {
                  setState(() {
                    selectedGender == Gender.female;
                  });
                },
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  //Weight Widget
                  Expanded(
                    child: reusableCard(
                      //Colour
                      kInactiveCardColor,
                      //Card Child
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                FontAwesomeIcons.minus,
                                () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RoundIconButton(
                                FontAwesomeIcons.plus,
                                () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      //On Pressed
                      () {
                        null;
                      },
                    ),
                  ),
                  //Age Widget
                  Expanded(
                    child: reusableCard(
                      //Colour
                      kInactiveCardColor,
                      //Card Child
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  age--;
                                });
                              }),
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                      //On Pressed
                      () {},
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(height, weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Result(
                        calc.calculatorBMI(),
                        calc.getInterpretation(),
                        calc.getResult(),
                      );
                    },
                  ),
                );
              },
              child: Container(
                color: kBottomContainerColor,
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: kBottomContainerHeight,
                child: const Center(
                  child: Text(
                    'CALCULATE',
                    style: kNumberTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(@required this.icon, @required this.whenPressed);
  final IconData icon;
  final VoidCallback whenPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: whenPressed,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        width: 40,
        height: 40,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      fillColor: Color.fromARGB(111, 255, 201, 219),
      child: Icon(icon),
    );
  }
}
