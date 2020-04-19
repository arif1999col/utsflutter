import 'package:flutter/material.dart';
class InputStyle {
  static OutlineInputBorder roundWhiteInput  = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(80)),
    borderSide: BorderSide(width: 1,color: Colors.black),
  );

  static OutlineInputBorder roundGreenInput  = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(80)),
    borderSide: BorderSide(width: 1,color: Colors.green),
  );

  static OutlineInputBorder roundBlueInput  = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(80)),
    borderSide: BorderSide(width: 1,color: Colors.blue),
  );

  static OutlineInputBorder roundPinkInput  = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(80)),
    borderSide: BorderSide(width: 1,color: Colors.white),
  );
}