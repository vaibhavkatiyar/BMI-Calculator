import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'calculated_brain.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
      ),
      home: InputPage(),
    );
  }
}
enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  int height=180;
  int weight=45;
  int age=10;

  Color maleCardColor = inactiveCardColour;
  Color femaleCardColor = inactiveCardColour;
  
  void updateColour(Gender gender)
  {
    if(gender==Gender.male)
      {
        if(maleCardColor==inactiveCardColour)
          {
            maleCardColor=themeColour;
            femaleCardColor=inactiveCardColour;
          }
        else
          {
            maleCardColor=inactiveCardColour;
          }
      }
    if(gender==Gender.female){
      if(femaleCardColor==inactiveCardColour)
        {
          femaleCardColor=themeColour;
          maleCardColor=inactiveCardColour;
        }
      else
        {
          femaleCardColor=inactiveCardColour;
        }
    }
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: maleCardColor,
                   cardChild: iconcontent(icon: FontAwesomeIcons.mars,label: 'MALE'),
                    ompress: (){
                    setState(() {
                      updateColour(Gender.male);
                    });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour: femaleCardColor,
                      cardChild: iconcontent(icon: FontAwesomeIcons.venus,label: 'FEMALE'),
                      ompress: (){
                       setState(() {
                         updateColour(Gender.female);
                       });
                      },
                ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: themeColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HEIGHT',style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: textStyle,
                            ),
                            Text(
                              'cm',
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x29EB1555) ,
                            thumbColor: Color(0xFFEB1555),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue){
                              setState((){
                                height = newValue.round();
                              });
                            },

                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ),
            Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: themeColour,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',style: labelTextStyle,),
                        Text(
                          weight.toString(),
                          style: textStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  if(weight>1) {
                                    weight--;
                                  }

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
                   child: ReusableCard(colour: themeColour,
                     cardChild: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text('AGE',style: labelTextStyle,),
                         Text(
                           age.toString(),
                           style: textStyle,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             RoundIconButton(
                                 icon: FontAwesomeIcons.plus,
                               onPressed: (){
                                   setState(() {
                                     if(age<150)
                                     age++;
                                   });
                               },
                             ),
                             SizedBox(
                               width: 10.0,
                             ),
                             RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               onPressed: (){
                                 setState(() {
                                   if(age>1)
                                   age--;
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
          GestureDetector(
            onTap: (){
              CalculatedBrain calc=new CalculatedBrain(height: height,weight: weight);
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.interpretation(),
                )));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
                margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFEB1555),
              )
            ),
          )
        ],
      )
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon,this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}
