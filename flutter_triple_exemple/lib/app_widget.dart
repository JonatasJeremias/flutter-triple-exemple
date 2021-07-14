import 'package:flutter/material.dart';
import 'package:flutter_triple_exemple/presentations/counter_page.dart';

import 'global_overlay.dart';

class MyApp extends StatelessWidget {
  final GlobalKey globalKey;
  const MyApp(this.globalKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GlobalOverlay(
        globalKey: globalKey,
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
