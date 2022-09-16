import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';
import '../../components/form/Input_text.dart';
import '../../components/form/Input_gender.dart';

enum Gender { male, female, others }

class ScreenFormTwo extends StatefulWidget {  
  final Function? nextForm;
  const ScreenFormTwo({Key? key,this.nextForm}) : super(key: key);

  @override
   State<ScreenFormTwo> createState() => _ScreenFormTwo();
}

class _ScreenFormTwo extends State<ScreenFormTwo> {    

  @override
  void initState() {        
    super.initState();      
  }

  @override
  Widget build(BuildContext context) {   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,   
      children:<Widget>[        
        Text('Full Name',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const InputText(hintText: "Your full name"),
        const SizedBox(height: 15),
        Text('Select Your Gender',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),   
        const InputGender(),
        const SizedBox(height: 15),
        SizedBox(
            width:double.infinity,                      
            child:SimpleElevatedButton(
                  color: globals.firstColor,
                  borderRadius: 10,
                  onPressed: widget.nextForm as void Function()?,
                  child: Text("Next",style:TextStyle(fontSize: globals.fontSize ,color: Colors.white,fontWeight: FontWeight.normal))                  
            )
        )             
      ]
    );
  }
}