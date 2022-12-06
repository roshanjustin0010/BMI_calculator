import 'package:flutter/material.dart';
import 'dart:math';

class Calculatorbrain{

  Calculatorbrain({
    required this.height,
    required this.weight,
});
  int height=0,weight=0;
  double bmi=0;

  caluculatebmi(){

    bmi=(weight / height / height)*10000;
    print(bmi);
    bmi.round();
    return bmi.round();
  }

  String getresult(){
    if(bmi>=25){
      return'Overweight';
    }
    else if(bmi>=18){
      return 'Normal';
    }
    else{
      return'Underweight';
    }

  }

  Color getcolor(){
    if(bmi>=25){
      return Colors.red;
    }
    else if(bmi>=18){
      return Colors.green;
    }
    else{
      return Colors.yellow;
    }
  }

  String gettext(){
    if(bmi>=25){
      return'You have overweight go Exercise ';
    }
    else if(bmi>=18){
      return 'You have normal body weight GOOD JOB';
    }
    else{
      return'You have lower than normal body weight you can eat little more';
    }
  }


  Color txtcolor(){
    if(getcolor()==Colors.red){
      return Colors.black;
    }
    else if(getcolor()==Colors.green){
      return Colors.white;
    }
    else{
      return Colors.black;
    }
  }

}