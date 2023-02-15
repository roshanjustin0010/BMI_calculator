import 'package:bmi_calulator/Screens/Home_page.dart';
import 'package:bmi_calulator/Widgets/bottombtn.dart';
import 'package:bmi_calulator/constants.dart';
import 'package:flutter/material.dart';

class Result_pg extends StatefulWidget {
  Result_pg({
    required this.getcol,
    required this.stg,
    required this.gettxt,
    required this.getcal,
    required this.txtcol,
  });
  var stg, getcol, gettxt, getcal, txtcol;

  @override
  State<Result_pg> createState() => _Result_pgState();
}

class _Result_pgState extends State<Result_pg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI RESULT')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 25.0,
          ),
          Container(
            child: Text('YOUR RESULTS', style: kTitleTextStyle),
          ),

          //resultbox

          Expanded(
            // flex: 2,
            child: Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color(0xFF1D1F33),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.stg,
                    style: kResultTextStyle,
                  ),
                  Text(
                    widget.getcal.toString(),
                    style: kBMITextStyle,
                  ),
                  Text(
                    widget.gettxt,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),

          //end result box

          //goback recalcukate

          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home_pg()));
            },
            child: Bottombutton(
              txt: 'RE-CALCULATE',
            ),
          ),
        ],
      ),
    );
  }
}
