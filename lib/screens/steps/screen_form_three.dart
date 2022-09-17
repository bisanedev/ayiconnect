import 'package:flutter/material.dart';
import '../../globals.dart' as globals;
import '../../components/form/button.dart';
import '../../components/form/Input_text.dart';
import './language_model.dart';
import './services_model.dart';


class ScreenFormThree extends StatelessWidget { 
  final Function? submitForm; 
  final TextEditingController? occupationController;
  final TextEditingController? companyController;
  final Language? languageItems;
  final Services? serviceItems;
  final TextEditingController? aboutYouController;


  const ScreenFormThree({
    Key? key,
    this.submitForm,
    this.occupationController,
    this.companyController,    
    this.languageItems,
    this.serviceItems,
    this.aboutYouController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,  
      children:<Widget>[        
        Text('Occupation',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputText(
          hintText: "Add your occupation",
          controller: occupationController,
        ), 
        const SizedBox(height: 15),
        Text('Company',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputText(
          hintText: "Add your company name",
          controller: companyController,
        ), 
        const SizedBox(height: 15),
        Text('Fluently spoken language(s)',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
  
        const SizedBox(height: 15),
        Text('Prefered Service',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputText(
          hintText: "Add your prefered service",
          controller: companyController,
        ),
        const SizedBox(height: 15),
        Text('Tell us about you',style:TextStyle(fontSize: globals.fontSize ,color: globals.fontColor,fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        InputText(
          hintText:"Provide some brief about yourself, so helper can get to know your a litle better before your connection.",
          isMultiline: true,
          maxLines:4,          
          controller: aboutYouController,
          maxLength:100,
        ), 
        const SizedBox(height: 25),     
        SizedBox(
          width:double.infinity,                      
          child:SimpleElevatedButton(
              color: globals.firstColor,
              borderRadius: 10,              
              onPressed: submitForm as void Function()?,
              child: const Text("Submit",style:TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal)),
          )
        ) 
      ]
    );
  }
}