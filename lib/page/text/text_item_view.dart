import 'package:dandu_provider/common/constants.dart';
import 'package:dandu_provider/model/X.dart';
import 'package:flutter/material.dart';

class TextItemView extends StatelessWidget {
  final X data;
  final Function onItemClick;

  TextItemView(this.data, {this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemClick,
      child: Card(
        child: Stack(
          children: <Widget>[
            ConstrainedBox(
              child: FadeInImage.assetNetwork(
                placeholder: Constants.LOCAL_BIG_IMAGE,
                image: data.thumbnail,
                fit: BoxFit.cover,
              ),
              constraints: BoxConstraints.expand(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                      height: 1,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        data.sign,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                      height: 1,
                      child: Divider(
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}