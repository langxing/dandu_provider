import 'package:dandu_provider/page/main.dart';
import 'package:dandu_provider/page/menu/menu_item_view.dart';
import 'package:dandu_provider/page/sound/sound_page.dart';
import 'package:dandu_provider/page/text/text_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final PageController controller;

  MenuPage({this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff313131),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.clear,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.animateToPage(
                          MainPage.PAGE_MAIN,
                          duration: Duration(milliseconds: 1500),
                          curve: ElasticOutCurve(2));
                    }
                ),
                Expanded(
                  child: Text(""),
                ),
                IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {

                    }
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
                "单读",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "We   Read   The   World",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              ),
              Expanded(
                  child: Divider(
                    color: Colors.white30,
                    height: 1,
                  )
              ),
            ],
          ),
          MenuItemView(
            "首页",
            onClick: () {
              controller.animateToPage(
                  MainPage.PAGE_MAIN,
                  duration: Duration(milliseconds: 1500),
                  curve: ElasticOutCurve(2));
            },
            paddingTop: 35,
          ),
          MenuItemView(
            "文字",
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => TextPage()));
            },
          ),
          MenuItemView(
            "声音",
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => SoundPage()));
            },
          ),
          MenuItemView(
            "影像",
            onClick: () {

            },
          ),
          MenuItemView(
            "单向历",
            onClick: () {

            },
            paddingBottom: 0,
          ),
          Padding(
              padding: EdgeInsets.only(top: 35),
            child: Text(
              "Powered by OWSPACE",
              style: TextStyle(
                color: Colors.white30,
                fontSize: 9
              ),),
          )
        ],
      ),
    );
  }

}