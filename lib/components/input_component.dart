import 'package:flutter/material.dart';
import 'package:uts/styles/input_style.dart';

class InputComponent extends StatelessWidget {

  final TextEditingController controller;
  final style;
  final String hint;
  final icon;
  final obscureText;
  final keyboardType;

  InputComponent({
    this.controller, 
    this.style, 
    this.hint, 
    this.icon, 
    this.obscureText = false,
    this.keyboardType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputStyle.roundWhiteInput,
            focusedBorder: style,
            enabledBorder: InputStyle.roundWhiteInput,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white30),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          style: TextStyle(color: Colors.white),
          obscureText: obscureText,
        )
    );
  }

}