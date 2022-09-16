import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';

class ScreenFormThree extends StatefulWidget { 
  final Function? submitForm; 
  const ScreenFormThree({Key? key,this.submitForm}) : super(key: key);

  @override
  State<ScreenFormThree> createState() => _ScreenFormThree();
}

class _ScreenFormThree extends State<ScreenFormThree> {

  @override
  void initState() {        
    super.initState();     
  }

  @override
  Widget build(BuildContext context) {   
    return Column(
      children:<Widget>[
        TextFormField(decoration:const InputDecoration(labelText: 'Mobile Number')), 
        const SizedBox(height: 20),     
        SizedBox(
          width:double.infinity,                      
          child:SimpleElevatedButton(
              color: globals.firstColor,
              borderRadius: 10,              
              onPressed: widget.submitForm as void Function()?,
              child: const Text("Submit",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.normal)),
          )
        ) 
      ]
    );
  }
}