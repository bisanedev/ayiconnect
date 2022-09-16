import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

class InputText extends StatelessWidget {
  const InputText({Key? key,this.controller,this.hintText,this.error,this.errorMessage,this.width = double.infinity}) : super(key: key);

  final TextEditingController? controller;      
  final String? hintText;  
  final bool? error;
  final String? errorMessage;  
  final double? width;

  @override
  Widget build(BuildContext context) {        
    return SizedBox(    
    width: width,
    child:TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      cursorColor: globals.firstColor,  
      autofocus: false,      
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: globals.fontSizeOther, color: const Color.fromRGBO(0, 0, 0, 0.425)),
        errorText: error !=null ? errorMessage:null,     
        fillColor: Colors.white,
        filled: true,        
        contentPadding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.125)),
            borderRadius: BorderRadius.circular(8),
        ),
        errorBorder:OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: globals.firstColor),
            borderRadius: BorderRadius.circular(8),
        ),     
      )
    )
    );
  }
}