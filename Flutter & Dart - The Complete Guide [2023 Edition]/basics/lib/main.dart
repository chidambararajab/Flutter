import 'package:flutter/material.dart';
import 'package:basics/gradient_container.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(colors: [
          Colors.blueGrey,
          Colors.deepOrangeAccent,
        ]),
      )));
}
