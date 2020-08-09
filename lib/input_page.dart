import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';
import 'constants.dart';

enum Gender{
  male,female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReuseableCard(
              onPress: (){
                setState(() {
                  selectedGender = Gender.male;
                });
              },  colour: selectedGender== Gender.male ? kActiveCardColor : kInactiveCardColor,
              cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),),),
              Expanded(child: ReuseableCard(
                onPress:(){
                  setState(() {
                    selectedGender=Gender.female;
                  });
                }, colour: selectedGender==Gender.female ? kActiveCardColor : kInactiveCardColor,cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),),
              ),],
          )),
          Expanded(
            child: ReuseableCard(colour: kActiveCardColor,
            cardChild: Column(
              children: <Widget>[
                Text('HEIGHT',style: kLabelTextStyle,),
                Row(
                  children: <Widget>[
                    Text('180', style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),
                    )
                  ],
                )
              ],
            ),
            ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReuseableCard(colour: kActiveCardColor,),),
              Expanded(child: ReuseableCard(colour: kActiveCardColor,),),],),),
        Container(
          color: kBottomContainerColor,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: kBottomContainerHeight,
        )
        ],
      ),
    );
  }
}

