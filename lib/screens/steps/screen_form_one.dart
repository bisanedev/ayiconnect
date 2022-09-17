import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';

class ScreenFormOne extends StatelessWidget { 
  final Function(int)? onPressed;
  final int? roleSelected;
  const ScreenFormOne({Key? key,this.roleSelected,this.onPressed}) : super(key: key);

    @override
  Widget build(BuildContext context) { 
    /*--- Responsive & adaptive variable ---*/
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenRatio = MediaQuery.of(context).devicePixelRatio;    
    /*--- EOF Responsive & adaptive variable ---*/  
    return Column(
      children: <Widget>[    
          Center(
            child:Container(
              height: screenHeight * 0.4,
              width: screenWidth * 0.7,              
              padding: const EdgeInsets.all(8.0),       
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(height: screenRatio*150 ,width: screenRatio*150,image: const AssetImage('assets/images/helper.png'), fit: BoxFit.fitWidth),
                  SizedBox(height:screenRatio*15),
                  Text("Are you seeking care for your\nlove one?",softWrap:true,textAlign: TextAlign.center,style:TextStyle(fontSize: screenRatio*17,color: globals.fontColor,fontWeight: FontWeight.normal)),                 
                  SizedBox(height:screenRatio*10),
                  SimpleElevatedButton(
                    width: screenRatio*200,
                    color: globals.firstColor,
                    elevation: 0,
                    borderRadius: 10,                  
                    onPressed: () {
                        onPressed!(0);
                    },
                    child: roleSelected == 0 ? 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.done,color:Colors.white,size:screenRatio*globals.fontSize),
                        SizedBox(width: screenRatio*8),
                        Text("Find a Helper",style:TextStyle(fontSize: screenRatio*globals.fontSize,color: Colors.white,fontWeight: FontWeight.normal))
                      ]
                    )
                    :Text("Find a Helper",style:TextStyle(fontSize: screenRatio*globals.fontSize,color: Colors.white,fontWeight: FontWeight.normal)),
                  )
                ]
              ),
            )
          ),
          SizedBox(height:screenRatio*10),
          Center(
            child:Container(
              height: screenHeight * 0.4,
              width: screenWidth * 0.7,              
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(height: screenRatio*150,width: screenRatio*150,image: const AssetImage('assets/images/job.png'),fit: BoxFit.fitWidth),
                  SizedBox(height:screenRatio*15),
                  Text("Or you're looking for a care,\n housekeeper, or tutor job?",softWrap:true,textAlign: TextAlign.center,style:TextStyle(fontSize:screenRatio* 17,color: globals.fontColor,fontWeight: FontWeight.normal)),                 
                  SizedBox(height:screenRatio*10),
                  SimpleElevatedButton(
                    width: screenRatio*200,
                    color: globals.secondColor,
                    elevation: 0,
                    borderRadius: 10,                  
                    onPressed: () {
                      onPressed!(1);
                    },
                    child: roleSelected == 1 ? 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Icon(Icons.done,color:Colors.white,size:screenRatio*globals.fontSize),
                        SizedBox(width: screenRatio*8),
                        Text("Find for a Job",style:TextStyle(fontSize: screenRatio*globals.fontSize,color: Colors.white,fontWeight: FontWeight.normal))
                      ]
                    )
                    : Text("Find for a Job",style:TextStyle(fontSize: screenRatio*globals.fontSize,color: Colors.white,fontWeight: FontWeight.normal)),
                  )
                ]
              ),
            )
          )
      ],
    );
  }
}