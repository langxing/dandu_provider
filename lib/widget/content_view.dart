import 'package:dandu_provider/common/constants.dart';
import 'package:dandu_provider/widget/default_view.dart';
import 'package:dandu_provider/widget/empty_view.dart';
import 'package:dandu_provider/widget/error_view.dart';
import 'package:dandu_provider/widget/loading_view.dart';
import 'package:dandu_provider/widget/network_error_view.dart';
import 'package:flutter/material.dart';

@immutable
// ignore: must_be_immutable
class ContentView extends StatelessWidget {
  final Widget content;
  final Widget emptyView;
  final Widget errorView;
  final Widget loadingView;
  final Widget networkErrorView;
  PageState pageState;

  ContentView(this.content, {
    this.pageState = PageState.STATE_LOADING,
    this.emptyView,
    this.errorView,
    this.loadingView,
    this.networkErrorView
  });

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = DefaultView();
    switch (pageState) {
      case PageState.STATE_EMPTY:
        currentWidget = emptyView?? EmptyView();
        break;
      case PageState.STATE_NOMAL:
        currentWidget = content;
        break;
      case PageState.STATE_ERROE:
        currentWidget = errorView?? ErrorView();
        break;
      case PageState.STATE_LOADING:
        currentWidget = loadingView?? LoadingView();
        break;
      case PageState.STATE_NETWORK_ERROR:
        currentWidget = networkErrorView?? NetworkErrorView();
        break;
    }
    return currentWidget;
  }
}