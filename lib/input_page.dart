import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);
const inactiveCardColor = Color(0xFF111328);

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
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReuseableCard(
              onPress: (){
                setState(() {
                  selectedGender = Gender.male;
                });
              },  colour: selectedGender== Gender.male ? activeCardColor : inactiveCardColor,
              cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),),),
              Expanded(child: ReuseableCard(
                onPress:(){
                  setState(() {
                    selectedGender=Gender.female;
                  });
                }, colour: selectedGender==Gender.female ? activeCardColor : inactiveCardColor,cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),),
              ),],
          )),
          Expanded(child: ReuseableCard(colour: activeCardColor,),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReuseableCard(colour: activeCardColor,),),
              Expanded(child: ReuseableCard(colour: activeCardColor,),),],),),
        Container(
          color: bottomContainerColor,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: bottomContainerHeight,
        )
        ],
      ),
    );
  }
}

