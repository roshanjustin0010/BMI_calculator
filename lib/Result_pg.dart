import 'package:bmi_calulator/Home_page.dart';
import 'package:flutter/material.dart';
import 'calculate.dart';

class Result_pg extends StatefulWidget {
  Result_pg({
    required this.getcol,
    required this.stg,
    required this.gettxt,
    required this.getcal,
    required this.txtcol,

});
  var stg,getcol,gettxt,getcal,txtcol;




  @override
  State<Result_pg> createState() => _Result_pgState();
}

class _Result_pgState extends State<Result_pg> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator Result')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 25,),
          
          Center(child: Text('YOUR RESULTS',style: TextStyle(fontSize: 40),)),

          SizedBox(height: 25,),

          //resultbox

          Container(
            height: 500,
            width: 350,
            color: widget.getcol,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Text(widget.stg,
                style: TextStyle(fontSize: 50,color: widget.txtcol),
                ),
                
                Text(widget.getcal.toString(),
                  style: TextStyle(fontSize: 50 ,color: widget.txtcol),
                ),
                
                Center(
                  child: Text(widget.gettxt,
                      style: TextStyle(fontSize: 30 , color: widget.txtcol)
                  ),
                ),
              ],

            ),
          ),

          //end result box

          SizedBox(height: 25,),

          //goback recalcukate

          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home_pg()));
            },
            child: Container(
              height: 50,
              width: 300,
              color:Color(0xFFE88100),
              child: Center(child: Text('Re-Calculate',
                style: TextStyle(fontSize: 30,color: Colors.black),

              )
              ),
            ),
          ),

        ],
      ),
    );
  }
}
