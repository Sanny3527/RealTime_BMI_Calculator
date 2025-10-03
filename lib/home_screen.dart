import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_time_bmi_calculator/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int heightSlider = 120;
  int age = 25;
  int weight = 50;

  int calculateBmi()   //calculate BMI
  {
    var heightMeter = heightSlider/100;
    var bmi = weight/ (heightMeter * heightMeter);
    return bmi.round();
  }

  LinearGradient maleColor = maleSelectedColor;
  LinearGradient femaleColor = femaleSelectedColor;
  LinearGradient boxColor = maleSelectedColor;

  void selectGender(bool gender)
  {
    if(gender)
      {
        setState(() {
          maleColor = maleSelectedColor;
          femaleColor = unSelectedColor;
          boxColor = maleSelectedColor;
        });
      }
    else{
      setState(() {
        maleColor = unSelectedColor;
        femaleColor = femaleSelectedColor;
        boxColor = femaleSelectedColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int bmiResult = calculateBmi();

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator",style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),

      backgroundColor: darkBlueColour,  //background color for whole screen
      body: Column(
        children: [
          Row(     //row for real time result
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your BMI is: $bmiResult", style: textStyle.copyWith(color: Colors.white),)    //real time result
            ],
          ),

          Expanded(
              child: Row(  //Row for male and female
                children: [
                  Expanded(
                      child: GestureDetector(  //gestureDetector for male
                        onTap: (){
                          selectGender(true);
                        },
                        child: ReusableBox(    //container 1 for male
                            color: maleColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.mars, size: 70, color: Colors.blue,),
                                  Text("Male", style: textStyle,),
                                ],
                            )
                        ),
                      )
                  ),

                  Expanded(
                      child: GestureDetector(   //gestureDetectore for female
                        onTap: (){
                          selectGender(false);
                        },
                        child: ReusableBox(   //container 2 for female
                            color: femaleColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.venus, size: 70, color: Colors.pink,),
                              Text("Female", style: textStyle,),
                            ],
                          )
                        ),
                      )
                  ),
                ],
              )
          ),

          Expanded(
              child: ReusableBox(   //container 3 for age
                color: boxColor,
                cardChild: Column(
                  children: [
                    Text("Age", style: textStyle),
                    
                    Row(    //Row for age years
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$age", style: textStyle,),
                        Text("yrs", style: textStyle,)
                      ],
                    ),

                    Slider(      //Age Slider
                        min: 1,
                        max: 100,
                        value: age.toDouble(),
                        activeColor: Colors.blueGrey,
                        inactiveColor: Colors.white70,
                        thumbColor: Colors.orange,
                        onChanged: (double value){
                          setState(() {
                            age = value.toInt();
                          });
                        }
                    )
                  ],
                )
              )
          ),

          Expanded(
              child: ReusableBox(   //container 4 for height
                color: boxColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Height", style: textStyle,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$heightSlider", style: textStyle,),
                    Text("cm", style: textStyle,)
                  ],
                ),

                Slider(      //Height Slider
                    min: 120,
                    max: 200,
                    value: heightSlider.toDouble(),
                    activeColor: Colors.blueGrey,
                    inactiveColor: Colors.white70,
                    thumbColor: Colors.orange,
                    onChanged: (double value){
                      setState(() {
                        heightSlider = value.toInt();
                      });
                    }
                )
              ],
            )
           )
          ),

          Expanded(   //container 5 for weight
              child: ReusableBox(
                color: boxColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Weight", style: textStyle,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$weight", style: textStyle,),
                        Text("kg", style: textStyle,)
                      ],
                    ),

                    Slider(      //weight Slider
                        min: 10,
                        max: 200,
                        value: weight.toDouble(),
                        activeColor: Colors.blueGrey,
                        inactiveColor: Colors.white70,
                        thumbColor: Colors.orange,
                        onChanged: (double value){
                          setState(() {
                            weight = value.toInt();
                          });
                        }
                    )
                  ],
                )
              )
          ),
        ],
      ),
    );
  }
}



class ReusableBox extends StatelessWidget {
  const ReusableBox({
    super.key,
    required this.cardChild,
    required this.color,
  });

  final Widget cardChild;
  final LinearGradient color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: cardChild,
    );
  }
}
