import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "拼命加载中...",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 13
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}