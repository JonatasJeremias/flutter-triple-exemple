import 'package:flutter/material.dart';

class GlobalOverlay extends StatelessWidget {
  final GlobalKey globalKey;
  final Widget child;

  GlobalOverlay({Key? key, required this.child, required this.globalKey})
      : super(key: globalKey);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
