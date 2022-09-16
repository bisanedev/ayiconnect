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
          const SizedBox(height:20),
          Center(
            child:Container(
              height: 300,
              width: 400,
              padding: const EdgeInsets.all(8.0),       
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(height: 150,width: 150,image: AssetImage('../../assets/images/helper.png')),
                  const SizedBox(height:15),
                  Text("Are you seeking care for your\n love one?",softWrap:true,textAlign: TextAlign.center,style:TextStyle(fontSize: 17,color: globals.fontColor,fontWeight: FontWeight.normal)),                 
                  const SizedBox(height:10),
                  SimpleElevatedButton(
                    width: 200,
                    color: globals.firstColor,
                    elevation: 0,
                    borderRadius: 10,                  
                    onPressed: widget.selectHelper as void Function()?,
                    child: const Text("Find a Helper",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.normal)),
                  )
                ]
              ),
            )
          ),
          const SizedBox(height:30),
          Center(
            child:Container(
              height: 300,
              width: 400,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(height: 150,width: 150,image: AssetImage('../../assets/images/job.png')),
                  const SizedBox(height:15),
                  Text("Or you're looking for a care,\n housekeeper, or tutor job?",softWrap:true,textAlign: TextAlign.center,style:TextStyle(fontSize: 17,color: globals.fontColor,fontWeight: FontWeight.normal)),                 
                  const SizedBox(height:10),
                  SimpleElevatedButton(
                    width: 200,
                    color: globals.secondColor,
                    elevation: 0,
                    borderRadius: 10,                  
                    onPressed: widget.selectJob as void Function()?,
                    child: const Text("Find for a Job",style:TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.normal)),
                  )
                ]
              ),
            )
          )
      ],
    );
  }  

}