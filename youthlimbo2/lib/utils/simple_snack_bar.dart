import 'package:flutter/material.dart';

void simpleSnackBar(BuildContext context, String text){
  final snackBar = SnackBar(content: Text(text));
  Scaffold.of(context).showSnackBar(snackBar);
}