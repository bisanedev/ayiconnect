import 'package:flutter/material.dart';

class screenFormOne extends StatefulWidget {  
  const screenFormOne({Key? key}) : super(key: key);

  @override
  _screenFormOne createState() => _screenFormOne();
}

class _screenFormOne extends State<screenFormOne> {

  @override
  void initState() {        
    super.initState();      
  }

  @override
  Widget build(BuildContext context) {   
    return Column(
      children: <Widget>[
          TextFormField(decoration: InputDecoration(labelText: 'Email Address')),
          TextFormField(decoration: InputDecoration(labelText: 'Password')),
      ],
    );
  }
}