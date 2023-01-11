import 'package:flutter/material.dart';

import 'Result_pg.dart';
import 'calculate.dart';

class Home_pg extends StatefulWidget {
  const Home_pg({Key? key}) : super(key: key);

  @override
  State<Home_pg> createState() => _Home_pgState();
}

class _Home_pgState extends State<Home_pg> {
  int _weight = 50;
  int _age = 15;
  int _height = 150;

  void _addweight() {
    setState(() {
      _weight++;
    });
  }

  void _subweight() {
    setState(() {
      _weight--;
    });
  }

  void _addage() {
    setState(() {
      _age++;
    });
  }

  void _subage() {
    setState(() {
      _age--;
    });
  }

  //result=(_weight/_height/_height)*10000;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('BMI Calculator'))),
        body: Column(
          children: [
            //gender
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //male box

                GestureDetector(
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Color(0xFF0A0E35),
                    child: Column(
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
                Container(
                  height: 150,
                  width: 150,
                  color: Color(0xFF0A0E35),
                  child: Column(
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
                ),
              ],
            ),
            //end of genderbox

            SizedBox(
              height: 25,
            ),

            //height slider

            Container(
              height: 200,
              width: 350,
              color: Color(0xFF0A0E35),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(fontSize: 30),
                    ),

                    Text(
                      '$_height cm',
                      style: TextStyle(fontSize: 30),
                    ),

                    //slider

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.grey.shade600,
                          inactiveTrackColor: Colors.white,
                          thumbColor: Color(0xFFE88100),
                          overlayColor: Color(0xFF7a7a7a),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 18),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25)),
                      child: Slider(
                        value: _height.toDouble(),
                        min: 120,
                        max: 220,
                        // activeColor: Color(0xff027b8d),
                        onChanged: (double newVal) {
                          setState(() {
                            _height = newVal.toInt();
                          });
                        },
                      ),
                    ),

                    //end slider
                  ],
                ),
              ),
            ),
            //end of height slider

            SizedBox(
              height: 25,
            ),

            //weight age box

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //weight box
                Container(
                  height: 150,
                  width: 150,
                  color: Color(0xFF0A0E35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Weight',
                        style: TextStyle(fontSize: 20),
                      ),

                      Text(
                        '$_weight',
                        style: TextStyle(fontSize: 30),
                      ),

                      //+ - button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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

                //age box
                Container(
                  height: 150,
                  width: 150,
                  color: Color(0xFF0A0E35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(fontSize: 20),
                      ),

                      Text(
                        '$_age',
                        style: TextStyle(fontSize: 30),
                      ),

                      //+ - button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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

            //end weight age box

            SizedBox(
              height: 25,
            ),

            //calculate button

            GestureDetector(
              onTap: () {
                Calculatorbrain calc =
                    Calculatorbrain(height: _height, weight: _weight);
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
                height: 50,
                width: 300,
                color: Color(0xFFE88100),
                child: Center(
                    child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
