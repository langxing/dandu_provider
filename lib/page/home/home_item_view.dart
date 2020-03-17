import 'package:dandu_provider/common/Constants.dart';
import 'package:dandu_provider/model/home_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeItemView extends StatelessWidget {
  HomeData _data;

  HomeItemView({@required HomeData data}) {
    _data = data;
  }

  @override
  Widget build(BuildContext context) {
    /// InkWell该widget用于补获页面的点击、滑动等事件
    return InkWell(
      child: Center(
        child: Column(
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: Constants.LOCAL_BIG_IMAGE,
              image: _data.thumbnail,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Divider(
              /// height分割线区域的高度，
              height: 2,
              /// 分割线真正的高度
              thickness: 2,
              color: Color(0xFFCCAD58),
            ),
            Container(
              width: 50,
              height: 15,
              padding: EdgeInsets.only(top: 0),
              color: Color(0xFFCCAD58),
              child: Center(
                child: Text(
                  "TO READ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                _data.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff010101),
                    fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _data.excerpt,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff7E7E7C),
                  fontSize: 15
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
              child: SizedBox(
                width: 150,
                child: Divider(
                  thickness: 0.5,
                  color: Color(0xffE0DEDF),
                ),
              ),
            ),
            Text(
              _data.author,
              style: TextStyle(
                color: Color(0xff474747),
                fontSize: 18
              ),
            ),
            /// 在listview中垂直不能使用此widget，因为List本身是无限高的
            Expanded(
                child: Text("")
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "image/icon_comment.png",
                    width: 15,
                    height: 15,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Text(
                      _data.comment,
                      style: TextStyle(
                        color: Color(0xff585858),
                        fontSize: 12
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset(
                      "image/icon_keep.png",
                      width: 15,
                      height: 15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Text(
                      _data.good,
                      style: TextStyle(
                          color: Color(0xff585858),
                          fontSize: 12
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text("")
                  ),
                  Text(
                    _data.view,
                    style: TextStyle(
                        color: Color(0xff797978),
                        fontSize: 12
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        print("点击了屏幕");
      },
    );
  }

}