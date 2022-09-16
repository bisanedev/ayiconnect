import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';

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
      children:<Widget>[
        TextFormField(decoration: InputDecoration(labelText: 'Home Address')),
        SizedBox(
            width:double.infinity,                      
            child:SimpleElevatedButton(
                  color: globals.firstColor,
                  child: Text("Next",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.normal)),
                  onPressed: widget.nextForm as void Function()?,
            )
        )             
      ]
    );
  }
}