import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../components/reusable_column_widget.dart';
import '../components/round_icon_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  /*Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;*/

  Gender selectedGender; //initialized as null.
  int height = 180;
  int weight = 60;
  int age = 22;

  /*void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColour == inactiveCardColour) {
        femaleCardColour = inactiveCardColour;
        /* secilip active olmussa, ikisinin ayni anda
           renginin degismemesi (ikisinin ayni anda secili gibi olmamasi) icin
           maleCard'a tiklaninca femaleCard inactive edilir. */
        maleCardColour = activeCardColour;
      } else {
        maleCardColour = inactiveCardColour;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColour == inactiveCardColour) {
        maleCardColour = inactiveCardColour;
        /*secilip active olmussa, ikisinin ayni anda
           renginin degismemesi (ikisinin ayni anda secili gibi olmamasi) icin
           femaleCard'a tiklaninca maleCard inactive edilir. */
        femaleCardColour = activeCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: ReusableColumnWidget(
                          iconData: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                        func: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        })),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: ReusableColumnWidget(
                      iconData: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    func: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT', style: kLabelTextStyle),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(height.toString(), style: kNumberCardStyle),
                              Text('cm'),
                            ]),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0XFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0XFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 25.0)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            //activeColor: Color(0xFFEB1555),
                            //inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberCardStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberCardStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calculatorBrain =
                  CalculatorBrain(weight: weight, height: height);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calculatorBrain.calculateBMI(),
                      resultText: calculatorBrain.getResult(),
                      interpretation: calculatorBrain.getInterpretation(),
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }
}
