import 'package:bmi_calulator/constants.dart';
import 'package:bmi_calulator/slider_height.dart';
import 'package:flutter/material.dart';

import 'Result_pg.dart';
import 'calculate.dart';
import 'usable_card.dart';

class Home_pg extends StatefulWidget {
  const Home_pg({Key? key}) : super(key: key);

  @override
  State<Home_pg> createState() => _Home_pgState();
}

class _Home_pgState extends State<Home_pg> {
  int weight = 50;
  int age = 15;
  int height = 150;

  void _addweight() {
    setState(() {
      weight++;
    });
  }

  void _subweight() {
    setState(() {
      weight--;
    });
  }

  void _addage() {
    setState(() {
      age++;
    });
  }

  void _subage() {
    setState(() {
      age--;
    });
  }

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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.male,
                          size: 75,
                          semanticLabel: 'male',
                        ),
                        Text(
                          'Male',
                          style: TextStyle(fontSize: 30),
                        )
                      ],
                    ),
                  ),
                ),

                //female box
                Expanded(
                    child: Usablecard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.female,
                        size: 75,
                        semanticLabel: 'Female',
                      ),
                      Text(
                        'Female',
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                )),
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
              children: [
                //weight box
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Weight',
                        style: TextStyle(fontSize: 20),
                      ),

                      Text(
                        '$weight',
                        style: TextStyle(fontSize: 30),
                      ),

                      //+ - button
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: _subweight,
                            backgroundColor: Color(0xFFE88100),
                            child: Icon(Icons.minimize),
                            heroTag: "btn3",
                          ),
                          FloatingActionButton(
                            onPressed: _addweight,
                            backgroundColor: Color(0xFFE88100),
                            child: Icon(Icons.add),
                            heroTag: "btn4",
                          )
                        ],
                      ),
                      //end + - button
                    ],
                  ),
                ),

                //Age box
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(fontSize: 20),
                      ),

                      Text(
                        '$age',
                        style: TextStyle(fontSize: 30),
                      ),

                      //+ - button
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: _subage,
                            backgroundColor: Color(0xFFE88100),
                            child: Icon(Icons.minimize),
                            heroTag: "btn1",
                          ),
                          FloatingActionButton(
                            onPressed: _addage,
                            backgroundColor: Color(0xFFE88100),
                            child: Icon(Icons.add),
                            heroTag: "btn2",
                          )
                        ],
                      ),

                      //end + - button
                    ],
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
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              color: Color(0xFFE88100),
              height: kBottomContainerHeight,
              child: Center(
                  child: Text(
                'Calculate',
                style: TextStyle(fontSize: 30, color: Colors.black),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
