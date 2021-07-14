import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'app_widget.dart';

void main() {
  final GlobalKey globalKey = new GlobalKey();
  OverlayEntry? entryLoading;

  TripleObserver.addListener((triple) {
    var context = globalKey.currentContext;

    if (triple.event == TripleEvent.error && context != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(triple.error.toString()),
      ));
    }

    if (triple.event == TripleEvent.loading && context != null) {
      if (triple.isLoading) {
        final child = Center(child: CircularProgressIndicator());
        entryLoading = OverlayEntry(builder: (context) => child);
        Overlay.of(context)?.insert(entryLoading!);
      } else {
        entryLoading?.remove();
      }
    }
  });

  runApp(MyApp(globalKey));
}
