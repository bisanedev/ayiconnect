import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

enum Gender { male, female, others }

class InputGender extends StatefulWidget {   
  const InputGender({Key? key}): super(key: key);

  @override
  State<InputGender> createState() => _InputGender();
}

class _InputGender extends State<InputGender> {  
    
  Gender? _gender;

  @override
  void initState() {        
    super.initState();        
  }   

  @override
  Widget build(BuildContext context) {    
    return SizedBox(      
      height: 50.0,
      child: ListView(
      scrollDirection: Axis.horizontal,      
      children: [
        Container(
          height: 50,
          width: 110,
          decoration: BoxDecoration(
            color: _gender == Gender.male ? globals.secondColor:Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1,color: _gender == Gender.male ? globals.secondColor:globals.formColorBorder)
          ),
          child:ListTile(
            title: _gender == Gender.male ? Text('Male',style:TextStyle(fontSize: globals.fontSizeOther, color: Colors.white)):Text('Male',style:TextStyle(fontSize: globals.fontSizeOther, color: const Color.fromRGBO(0, 0, 0, 0.425))),
            horizontalTitleGap: 0,
            contentPadding:const EdgeInsets.symmetric(horizontal: 8.0),
            leading: Radio<Gender>(              
              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return globals.formColorBorder.withOpacity(.32);
                }
                else if (states.contains(MaterialState.selected)) {
                  return Colors.white;
                }
                return globals.formColorBorder;
              }),
              value: Gender.male,
              groupValue: _gender,
              onChanged: (Gender? value) {                
                setState(() {
                  _gender = value;
                });
              },
            ),
          )
        ),
        const SizedBox(width: 17),
        Container(
          height: 50,
          width: 110,
          decoration: BoxDecoration(
            color: _gender == Gender.female ? globals.secondColor:Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1,color: _gender == Gender.female ? globals.secondColor:globals.formColorBorder)
          ),
          child:ListTile(
            title: _gender == Gender.female ? Text('Female',style:TextStyle(fontSize: globals.fontSizeOther, color: Colors.white)):Text('Female',style:TextStyle(fontSize: globals.fontSizeOther, color: const Color.fromRGBO(0, 0, 0, 0.425))),
            horizontalTitleGap: 0,
            contentPadding:const EdgeInsets.symmetric(horizontal: 8.0),
            leading: Radio<Gender>(              
              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return globals.formColorBorder.withOpacity(.32);
                }
                else if (states.contains(MaterialState.selected)) {
                  return Colors.white;
                }
                return globals.formColorBorder;
              }),
              value: Gender.female,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
          )
        ),
        const SizedBox(width: 17),
        Container(
          height: 50,
          width: 110,
          decoration: BoxDecoration(
            color: _gender == Gender.others ? globals.secondColor:Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1,color: _gender == Gender.others ? globals.secondColor:globals.formColorBorder)
          ),
          child:ListTile(
            title: _gender == Gender.others ? Text('Others',style:TextStyle(fontSize: globals.fontSizeOther, color: Colors.white)):Text('Others',style:TextStyle(fontSize: globals.fontSizeOther, color: const Color.fromRGBO(0, 0, 0, 0.425))),
            horizontalTitleGap: 0,
            contentPadding:const EdgeInsets.symmetric(horizontal: 8.0),
            leading: Radio<Gender>(              
              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return globals.formColorBorder.withOpacity(.32);
                }
                else if (states.contains(MaterialState.selected)) {
                  return Colors.white;
                }
                return globals.formColorBorder;
              }),            
              value: Gender.others,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
          )
        )  
      ],
    )
    );
  }
  /*--- Script here ---*/

  @override
  void dispose() {    
    super.dispose();
  }
  /*--- End Script Here ---*/
}