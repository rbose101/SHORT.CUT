import 'package:custom_url_shortner/components/constants.dart';
import 'package:flutter/material.dart';

AppBar appBar = AppBar(
  backgroundColor: bgColor,
  centerTitle: false,
  title: Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(height: 200, child: Image.asset("assets/logo.png")),
  ),
);
