import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

class InputGender extends StatelessWidget {
  final int? gender; 
  final Function(int)? onPressed;
  const InputGender({
    Key? key,
    this.gender,
    this.onPressed
  }): super(key: key); 

  @override
  Widget build(BuildContext context) {      
    return SizedBox(      
      height:  55.0,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,      
      children: [
        InkWell(
        onTap: () {
            onPressed!(0);
        },
        child: Container(
          height:  55,
          alignment: Alignment.center,
          width:  120,
          decoration: BoxDecoration(
            color: gender == 0 ? globals.secondColor:Colors.white,
            borderRadius: BorderRadius.circular( 8),
            border: Border.all(width:  1,color: gender == 0 ? globals.secondColor:globals.formColorBorder)
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [              
              gender == 0 ? Icon(Icons.radio_button_checked,color: Colors.white,size:  24.0):Icon(Icons.radio_button_off,color: globals.formColorBorder,size:  24.0),
              SizedBox(width:  10),
              gender == 0 ? Text('Male',style:TextStyle(fontSize:  globals.fontSizeOther, color: Colors.white)):Text('Male',style:TextStyle(fontSize:  globals.fontSizeOther, color: const Color.fromRGBO(0, 0, 0, 0.425))),
            ],            
          )
        )        
        ),
        SizedBox(width:  17),
        InkWell(
        onTap:() {
            onPressed!(1);
        },
        child: Container(
          height:  55,
          alignment: Alignment.center,
          width:  120,
          decoration: BoxDecoration(
            color: gender == 1 ? globals.secondColor:Colors.white,
            borderRadius: BorderRadius.circular( 8),
            border: Border.all(width:  1,color: gender == 1 ? globals.secondColor:globals.formColorBorder)
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [              
              gender == 1 ? Icon(Icons.radio_button_checked,color: Colors.white,size:  24.0):Icon(Icons.radio_button_off,color: globals.formColorBorder,size:  24.0),
              SizedBox(width:  10),
              gender == 1 ? Text('Female',style:TextStyle(fontSize:  globals.fontSizeOther, color: Colors.white)):Text('Female',style:TextStyle(fontSize:  globals.fontSizeOther, color: const Color.fromRGBO(0, 0, 0, 0.425))),
            ],            
          )
          )        
        ),
        const SizedBox(width: 17),
        InkWell(
        onTap: () {
            onPressed!(2);
        },
        child: Container(
          height:  55,
          alignment: Alignment.center,
          width:  120,
          decoration: BoxDecoration(
            color: gender == 2 ? globals.secondColor:Colors.white,
            borderRadius: BorderRadius.circular( 8),
            border: Border.all(width:  1,color: gender == 2 ? globals.secondColor:globals.formColorBorder)
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [              
              gender == 2 ? Icon(Icons.radio_button_checked,color: Colors.white,size:  24.0):Icon(Icons.radio_button_off,color: globals.formColorBorder,size:  24.0),
              SizedBox(width:  10),
              gender == 2 ? Text('Others',style:TextStyle(fontSize:  globals.fontSizeOther, color: Colors.white)):Text('Others',style:TextStyle(fontSize:  globals.fontSizeOther, color: const Color.fromRGBO(0, 0, 0, 0.425))),
            ],            
          )      
        )        
        )
      ],
    )
    );
  }
}