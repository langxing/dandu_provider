import 'package:dandu_provider/model/home_article.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider<HomeArticle>.value(value: HomeArticle())
];
