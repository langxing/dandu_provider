import 'package:dandu_provider/page/sound/sound_viewmodel.dart';
import 'package:dandu_provider/widget/titlebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoundPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) {
              SoundViewModel _viewmodel = SoundViewModel();
              _viewmodel.init(context);
              return _viewmodel;
            })
        ],
      child: Scaffold(
        appBar: TitleBar("声音"),
        body: Consumer<SoundViewModel>(
            builder: (_, provider, child) {
              return ListView.builder(
                  itemCount: provider.data.length,
                  itemBuilder: (_, index) => Text(provider.data[index].author)
              );
            }
        ),
      ),
    );
  }

}