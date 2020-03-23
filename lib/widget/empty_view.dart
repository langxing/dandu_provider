import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                "image/icon_empty.png",
              width: 80,
              height: 80,
            ),
            Text(
              "暂无数据",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12
              ),
            )
          ],
        ),
      ),
    );
  }

}
