import 'package:dandu_provider/common/provider_manager.dart';
import 'package:dandu_provider/page/home/home_page.dart';
import 'package:dandu_provider/page/menu/menu_page.dart';
import 'package:dandu_provider/page/mine/mine_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  /// 全局共享数据
  MultiProvider(
    providers: providers,
    child: App(),
  )
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color(0xff313131),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  static final PAGE_SETTING = 0;
  static final PAGE_MAIN = 1;
  static final PAGE_MINE = 2;

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {
  final _controller = PageController();

  List<StatelessWidget> pageList;

  @override
  void initState() {
    super.initState();
    pageList = [MenuPage(controller: _controller,), HomePage(controller: _controller,), MinePage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: _controller,
          itemCount: pageList.length,
          itemBuilder: (context, index) => pageList[index]
      ),
    );
  }
}
