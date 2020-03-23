import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white70,
        child: Center(
            child: Text("加载失败")
        )
    );
  }
}