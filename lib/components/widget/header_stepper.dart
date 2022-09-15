import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

class HeaderStepper extends StatelessWidget implements PreferredSizeWidget {
  const HeaderStepper({ this.onBack,this.textBack,Key? key}) : super(key: key);

  final Function? onBack;      
  final String? textBack;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {        
    return Container(      
      height: 40,      
      decoration: BoxDecoration(        
        color: globals.firstColor,
      )    
    );
  }
}