import 'package:flutter/material.dart';

Widget BotonMenu({context, text, width, textColor, color}) {
  return RaisedButton(
    color: color,
      onPressed: (){},
    padding: EdgeInsets.symmetric(horizontal: width, vertical: 20),
      child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
  );
}