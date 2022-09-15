import 'package:flutter/material.dart';

class screenFormTwo extends StatefulWidget {  
  const screenFormTwo({Key? key}) : super(key: key);

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
        TextFormField(decoration: InputDecoration(labelText: 'Postcode')),         
      ]
    );
  }
}