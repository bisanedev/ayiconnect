import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';

class ScreenFormOne extends StatefulWidget { 
  final Function? selectHelper;
  final Function? selectJob; 
  const ScreenFormOne({Key? key,this.selectHelper,this.selectJob}) : super(key: key);

  @override
  State<ScreenFormOne> createState() => _ScreenFormOne();
}

class _ScreenFormOne extends State<ScreenFormOne> {



  @override
  void initState() {        
    super.initState();      
  }

  @override
  Widget build(BuildContext context) {   
    return Column(
      children: <Widget>[
          const SizedBox(height:200),
          Center(
            child:SizedBox(
                width: 200,                                   
                child: SimpleElevatedButton(
                  color: globals.firstColor,
                  borderRadius: 10,                  
                  onPressed: widget.selectHelper as void Function()?,
                  child: const Text("Find a Helper",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.normal)),
                )
            )
          ),
          const SizedBox(height:200),
          Center(
            child:SizedBox(
                width: 200,                      
                child: SimpleElevatedButton(
                  color: globals.secondColor,
                  borderRadius: 10,                  
                  onPressed: widget.selectJob as void Function()?,
                  child: const Text("Find for a Job",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.normal)),
                )
            )
          )
      ],
    );
  }  

}