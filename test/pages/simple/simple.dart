/* PAGE VIEW */
import 'package:flutter/material.dart';
import 'package:hermep/hermep.dart';

import 'simple_model.dart';
import 'simple_presenter.dart';

abstract class SimpleView {
  void incrementCounter();
}

/* PAGE */
class SimplePage extends StatefulWidget {
  SimplePage({Key? key});

  @override
  _SimplePageState createState() => _SimplePageState();
}

class _SimplePageState
    extends HermepPage<SimpleModel, SimplePresenter, SimplePage>
    with SimpleView {
  @override
  void createAnimations() {}

  @override
  void afterViewInit() { }

  @override
  HermepPresenter createPresenter() => SimplePresenter(this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              this.viewModel.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: ValueKey('Increment_Button'),
        onPressed: this.presenter.onPlusTap,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void incrementCounter() {
    this.viewModel.counter++;
    this.refreshView();
  }
}
