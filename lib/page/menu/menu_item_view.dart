import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuItemView extends StatelessWidget {
  final String content;
  final Function onClick;
  double paddingTop, paddingBottom;

  MenuItemView(this.content, {this.onClick, this.paddingTop = 0, this.paddingBottom = 10});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, paddingTop, 0, paddingBottom),
      child: FlatButton(
          onPressed: onClick,
          child: Text(
            content,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35
            ),
          )
      ),
    );
  }

}