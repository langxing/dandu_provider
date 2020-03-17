import 'package:dandu_provider/provider/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
      create: (context) {
        HomeViewModel _viewmodel = HomeViewModel();
        _viewmodel.init(context);
        return _viewmodel;
      }
  )
];
