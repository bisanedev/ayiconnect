import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';

class screenFormThree extends StatefulWidget { 
  final Function? submitForm; 
  const screenFormThree({Key? key,this.submitForm}) : super(key: key);

  @override
  _screenFormThree createState() => _screenFormThree();
}

class _screenFormThree extends State<screenFormThree> {

  @override
  void initState() {        
    super.initState();     
  }

  @override
  Widget build(BuildContext context) {   
    return Column(
      children:<Widget>[
        TextFormField(decoration: InputDecoration(labelText: 'Mobile Number')), 
        SizedBox(height: 20),     
        SizedBox(
          width:double.infinity,                      
          child:SimpleElevatedButton(
              color: globals.firstColor,
              child: Text("Submit",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.normal)),
              onPressed: widget.submitForm as void Function()?,
          )
        ) 
      ]
    );
  }
}