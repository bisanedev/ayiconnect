import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';

class screenFormOne extends StatefulWidget { 
  final Function? selectHelper;
  final Function? selectJob; 
  const screenFormOne({Key? key,this.selectHelper,this.selectJob}) : super(key: key);

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
          SizedBox(height:200),
          Center(
            child:SizedBox(
                width: 200,                                   
                child: SimpleElevatedButton(
                  color: globals.firstColor,
                  child: Text("Find a Helper",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.normal)),
                  onPressed: widget.selectHelper as void Function()?,
                )
            )
          ),
          SizedBox(height:200),
          Center(
            child:SizedBox(
                width: 200,                      
                child: SimpleElevatedButton(
                  color: globals.secondColor,
                  child: Text("Find for a Job",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.normal)),
                  onPressed: widget.selectJob as void Function()?,
                )
            )
          )
      ],
    );
  }  

}