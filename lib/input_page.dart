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
  int height=180;

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic ,
                  children: <Widget>[
                    Text(height.toString(), style: kNumberTextStyle),
                    Text('cm',style: kLabelTextStyle,),
                  ],
                ),
                  SliderTheme(data: SliderTheme.of(context).copyWith(
                    inactiveTickMarkColor: Color(0xff8D8E98),
                      thumbColor: Color(0xFFEB1555) ,
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x129EB1555),
                      thumbShape:RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),),
                    child: Slider(value: height.toDouble(),
                    min: 120.0, max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xff8D8E98),
                    onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                    print(newValue);
                    },
                  ),
                ),
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

