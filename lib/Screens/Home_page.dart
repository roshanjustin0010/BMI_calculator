import 'package:bmi_calulator/Screens/Result_pg.dart';
import 'package:bmi_calulator/Widgets/slider_height.dart';
import 'package:bmi_calulator/constants.dart';
import 'package:flutter/material.dart';

import '../Brain/calculate.dart';
import '../Widgets/bottombtn.dart';
import '../Widgets/floatbutton.dart';
import '../Widgets/usable_card.dart';

class Home_pg extends StatefulWidget {
  const Home_pg({Key? key}) : super(key: key);

  @override
  State<Home_pg> createState() => _Home_pgState();
}

class _Home_pgState extends State<Home_pg> {
  int weight = 50;
  int age = 15;
  int height = 180;

  //result=(_weight/_height/_height)*10000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //gender
          Expanded(
            child: Row(
              children: [
                //male box

                Expanded(
                  child: Usablecard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          size: 100.0,
                          semanticLabel: 'male',
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Male',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                  ),
                ),

                //female box
                Expanded(
                  child: Usablecard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 100.0,
                          semanticLabel: 'Female',
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Female',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //end of genderbox

          //height slider

          Expanded(
            child: Usablecard(
              cardChild: Heightslider(
                height: height,
                slide: Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 220,
                  onChanged: (double newVal) {
                    setState(() {
                      height = newVal.toInt();
                    });
                  },
                ),
              ),
            ),
          ),

          //end of height slider

          //weight age box

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //weight box
                Expanded(
                  child: Usablecard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),

                        Text(
                          '$weight',
                          style: kNumberTextStyle,
                        ),

                        //+ - button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Actionbutton(
                              btno: 2,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: Icons.minimize,
                            ),
                            Actionbutton(
                              btno: 1,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        ),
                        //end + - button
                      ],
                    ),
                  ),
                ),

                //Age box
                Expanded(
                  child: Usablecard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),

                        Text(
                          '$age',
                          style: kNumberTextStyle,
                        ),

                        //+ - button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Actionbutton(
                              btno: 3,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icons.minimize,
                            ),
                            Actionbutton(
                              btno: 4,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        ),
                        //end + - button
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //end weight age box

          //calculate button

          GestureDetector(
            onTap: () {
              Calculatorbrain calc =
                  Calculatorbrain(height: height, weight: weight);
              var calbmi = calc.caluculatebmi();
              var stage = calc.getresult();
              var txt = calc.gettext();
              var bgcol = calc.getcolor();
              var txtcolr = calc.txtcolor();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Result_pg(
                        getcol: bgcol,
                        stg: stage,
                        gettxt: txt,
                        getcal: calbmi,
                        txtcol: txtcolr,
                      )));
            },
            child: Bottombutton(
              txt: "CALCULATE",
            ),
          ),
        ],
      ),
    );
  }
}
