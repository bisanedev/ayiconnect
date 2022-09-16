import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';
import '../../components/form/Input_text.dart';

class screenFormTwo extends StatefulWidget {  
  final Function? nextForm;
  const screenFormTwo({Key? key,this.nextForm}) : super(key: key);

  @override
  _screenFormTwo createState() => _screenFormTwo();
}

class _screenFormTwo extends State<screenFormTwo> {

  @override
  void initState() {        
    super.initState();      
  }

  @override
  Widget build(BuildContext context) {   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,   
      children:<Widget>[        
        Text('Full Name',style:TextStyle(fontSize: 16,color: globals.fontColor,fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        InputText(hintText: "Your full name"),   
        SizedBox(height: 20),
        SizedBox(
            width:double.infinity,                      
            child:SimpleElevatedButton(
                  color: globals.firstColor,
                  borderRadius: 10,
                  child: Text("Next",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.normal)),
                  onPressed: widget.nextForm as void Function()?,
            )
        )             
      ]
    );
  }
}