import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poytaxtlar/screens/home/home.dart';
import 'package:poytaxtlar/utils/themes.dart';
import 'package:provider/provider.dart';

import 'main_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => MainProvider(),
      )
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ThemeStream.setTheme.stream,
        initialData: false,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return MaterialApp(
            theme: snapshot.data ? MyTheme.dark() : MyTheme.light(),
            home: HomePage(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

class ThemeStream {
  static StreamController<bool> setTheme = StreamController();
}
