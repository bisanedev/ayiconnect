import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

class InputLikeText extends StatelessWidget {
  const InputLikeText({Key? key,this.value = "", this.hintText,this.width = double.infinity,this.iconData,this.onPressed}) : super(key: key);
  
  final String value;
  final String? hintText;
  final double? width;      
  final IconData? iconData;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {        
    return GestureDetector(
        onTap: onPressed as void Function()?,
        child:Container(       
          width: width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,      
            border: Border.all(color: globals.formColorBorder,width: 1)      
          ),
          child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  hintText == null ? 
                  Text(value,style:TextStyle(fontSize: globals.fontSizeOther ,color: globals.fontColor,fontWeight: FontWeight.normal)):
                  Text(hintText ?? "Hint text",style:TextStyle(fontSize: globals.fontSizeOther ,color: globals.formColorBorder,fontWeight: FontWeight.normal)),
                  Icon(iconData,color: globals.formColorBorder,size: 20),
                ],
              )
          )
    );    
  }
}