import 'package:flutter/material.dart';

//nos permite barias si es numerico
bool isNumeric(String s) {
  if (s.isEmpty) return false;

  final n = num.tryParse(s);

  return (n == null) ? false : true;
}
