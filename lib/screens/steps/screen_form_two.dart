import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';
import '../../components/form/Input_text.dart';
import '../../components/form/Input_like_text.dart';
import '../../components/form/Input_gender.dart';

enum Gender { male, female, others }

class ScreenFormTwo extends StatelessWidget {  
  final Function? nextForm;
  final TextEditingController? fullNameController;
  final String? calendarValue;
  final Function? calendarOnPressed;  

  const ScreenFormTwo({Key? key,
    this.nextForm,
    this.fullNameController,
    this.calendarValue,
    this.calendarOnPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,   
      children:<Widget>[        
        Text('Full Name',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputText(
          hintText: "Your full name",
          controller: fullNameController,
        ),
        const SizedBox(height: 15),
        Text('Select Your Gender',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),   
        const InputGender(),
        const SizedBox(height: 15),
        Text('Choose Your Date of Birth',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputLikeText(                    
          iconData: Icons.calendar_month_outlined,
          hintText: "MM/DD/YYYY",
          value: calendarValue,                
          onPressed:calendarOnPressed as void Function()?
        ),
        const SizedBox(height: 15),
        SizedBox(
            width:double.infinity,                      
            child:SimpleElevatedButton(
                color: globals.firstColor,
                borderRadius: 10,
                onPressed: nextForm as void Function()?,
                child: Text("Next",style:TextStyle(fontSize: globals.fontSize ,color: Colors.white,fontWeight: FontWeight.normal))                  
            )
        )             
      ]
    );
  }
}