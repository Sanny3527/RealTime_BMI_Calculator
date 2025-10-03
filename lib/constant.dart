import 'package:flutter/material.dart';

const numTextStyle = TextStyle(fontSize: 44, fontWeight: FontWeight.w700, color: Colors.white);
const textStyle = TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold);
const backgroundColor = Color(0xFF131145);
var selectedColor = Color(0xff062840);
var blueColor = Color(0xff033e66);
var selectedColour = Color(0xff062840);
const darkBlueColour = Color(0xff002640);
const maleColour = Color(0xff033e66);
const femaleColour = Color(0xff033e66);
const pinkColor = Color(0xffFF189E);

const LinearGradient maleSelectedColor = LinearGradient(
    colors: [
      Colors.blue,
      Colors.yellowAccent
    ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
);

const LinearGradient femaleSelectedColor = LinearGradient(    //female gradient color
    colors: [
      Colors.pink,
      Colors.lightBlueAccent,
    ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const LinearGradient unSelectedColor = LinearGradient(    // gradient color for unSelection
  colors: [
    Colors.blueGrey,
    Colors.white12,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

