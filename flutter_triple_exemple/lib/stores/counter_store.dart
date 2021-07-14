import 'package:flutter_triple/flutter_triple.dart';

class CounterStore extends StreamStore<Exception, int> {
  CounterStore() : super(0);

  getFromServer() async {
    execute(() async {
      await Future.delayed(Duration(seconds: 2));
      return 5;
    });
  }

  increment() {
    execute(() async {
      await Future.delayed(Duration(seconds: 1));

      if (state > 6) {
        throw Exception("Limite de incrementos atingido!");
      }
      return state + 1;
    });
  }
}
