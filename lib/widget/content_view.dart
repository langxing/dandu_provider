import 'package:dandu_provider/common/constants.dart';
import 'package:dandu_provider/widget/empty_view.dart';
import 'package:dandu_provider/widget/error_view.dart';
import 'package:dandu_provider/widget/loading_view.dart';
import 'package:dandu_provider/widget/network_error_view.dart';
import 'package:flutter/material.dart';

class ContentView extends StatelessWidget {
  final PageState pageState;
  final Widget bodyView;
  final Widget emptyView;
  final Widget errorView;
  final Widget loadingView;
  final Widget networkErrorView;

  ContentView({
    @required this.pageState,
    @required this.bodyView,
    this.emptyView,
    this.errorView,
    this.loadingView,
    this.networkErrorView
  });

  @override
  Widget build(BuildContext context) {
    Widget currentWidget;
    switch (pageState) {
      case PageState.STATE_EMPTY:
        currentWidget = emptyView?? EmptyView();
        break;
      case PageState.STATE_NOMAL:
        currentWidget = bodyView;
        break;
      case PageState.STATE_ERROE:
        currentWidget = errorView?? ErrorView();
        break;
      case PageState.STATE_LOADING:
        currentWidget = loadingView?? LoadingView(isHide: false);
        break;
      case PageState.STATE_NETWORK_ERROR:
        currentWidget = networkErrorView?? NetworkErrorView();
        break;
    }
    return currentWidget;
  }
}