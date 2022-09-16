import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';

class ScreenFormOne extends StatelessWidget { 
  final Function? selectHelper;
  final Function? selectJob; 
  final int? roleSelected;
  const ScreenFormOne({Key? key,this.selectHelper,this.selectJob,this.roleSelected}) : super(key: key);

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
                    onPressed: selectHelper as void Function()?,
                    child: roleSelected == 0 ? 
                    Row(
                      children: [
                        Icon(Icons.done,color:Colors.white,size:globals.fontSize),
                        const SizedBox(width: 8),
                        Text("Find a Helper",style:TextStyle(fontSize: globals.fontSize,color: Colors.white,fontWeight: FontWeight.normal))
                      ]
                    )
                    :Text("Find a Helper",style:TextStyle(fontSize: globals.fontSize,color: Colors.white,fontWeight: FontWeight.normal)),
                  )
                ]
              ),
            )
          ),
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
                  Image(height: 150,width: 150,image: AssetImage('../../assets/images/job.png')),
                  const SizedBox(height:15),
                  Text("Or you're looking for a care,\n housekeeper, or tutor job?",softWrap:true,textAlign: TextAlign.center,style:TextStyle(fontSize: 17,color: globals.fontColor,fontWeight: FontWeight.normal)),                 
                  const SizedBox(height:10),
                  SimpleElevatedButton(
                    width: 200,
                    color: globals.secondColor,
                    elevation: 0,
                    borderRadius: 10,                  
                    onPressed: selectJob as void Function()?,
                    child: roleSelected == 1 ? 
                    Row(
                      children:[
                        Icon(Icons.done,color:Colors.white,size:globals.fontSize),
                        const SizedBox(width: 8),
                        Text("Find for a Job",style:TextStyle(fontSize: globals.fontSize,color: Colors.white,fontWeight: FontWeight.normal))
                      ]
                    )
                    : Text("Find for a Job",style:TextStyle(fontSize: globals.fontSize,color: Colors.white,fontWeight: FontWeight.normal)),
                  )
                ]
              ),
            )
          )
      ],
    );
  }
}