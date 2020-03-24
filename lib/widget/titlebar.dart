import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleBar extends AppBar {
  final String titleText;
  Color titleColor, backgroundColor;
  double titleSize;

  TitleBar(this.titleText, {
    this.titleColor = Colors.white,
    this.backgroundColor = const Color(0xff313131),
    this.titleSize = 18
  }): super(title: Center(
    child: Text(
      titleText,
      style: TextStyle(
          color: titleColor,
          fontSize: titleSize
      ),),
  ));

}