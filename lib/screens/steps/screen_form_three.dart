import 'package:flutter/material.dart';

class screenFormThree extends StatefulWidget {  
  const screenFormThree({Key? key}) : super(key: key);

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
        TextFormField(decoration: InputDecoration(labelText: 'Mobile Number'))        
      ]
    );
  }
}