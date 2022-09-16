import 'package:flutter/material.dart';

class SimpleElevatedButton extends StatelessWidget {
  const SimpleElevatedButton(
      {this.child,
      this.color,
      this.onPressed,
      this.borderRadius = 6,
      this.elevation = 0,
      this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      this.width = double.infinity,
      Key? key})
      : super(key: key);      
  final Color? color;
  final Widget? child;
  final Function? onPressed;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final double width;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return SizedBox(
      width: width, 
      child: ElevatedButton(      
        style: ElevatedButton.styleFrom(
          elevation:elevation,
          padding: padding,
          backgroundColor: color ?? currentTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed as void Function()?,
        child: child,
      )      
    );
  }
}