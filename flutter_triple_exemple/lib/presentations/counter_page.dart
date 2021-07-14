import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter_triple_exemple/stores/counter_store.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Em um projeto real, essa instancia viria por injeção de dependencia,
  // com o Modular por exemplo: Modular.get<CounterStore>();
  final CounterStore counterStore = CounterStore();

  @override
  void initState() {
    super.initState();

    counterStore.getFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ScopedBuilder(
          store: counterStore,
          onState: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$state',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterStore.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
