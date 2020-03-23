import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {

            }
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {

              }
              )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
                "单读",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Divider(
                    color: Colors.white30,
                    height: 1,
                  )
              ),
              Text(
                  "WE READ THE WORLD",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
                ),
              ),
              Expanded(
                  child: Divider(
                    color: Colors.white30,
                    height: 1,
                  )
              ),
            ],
          )
        ],
      ),
    );
  }

}