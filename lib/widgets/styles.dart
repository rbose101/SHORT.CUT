import 'package:flutter/material.dart';

Widget customText(
  String text,
  Color color, {
  // ignore: non_constant_identifier_names
  double font_size = 20,
  FontWeight fontWt = FontWeight.normal,
}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: font_size, fontWeight: fontWt),
  );
}
