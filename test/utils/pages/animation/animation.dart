import 'package:flutter/material.dart';
import 'package:hermep/hermep.dart';

import 'animation_presenter.dart';
import 'animation_model.dart';

mixin AnimationView {
  void incrementCounter();
}

class AnimationPage extends StatefulWidget {
  AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState
    extends HermepPage<AnimationModel, AnimationPresenter, AnimationPage>
    with AnimationView, TickerProviderStateMixin {
  @override
  HermepPresenter createPresenter() => AnimationPresenter(this);

  @override
  void afterViewInit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: this.viewModel.animation.value,
              width: this.viewModel.animation.value,
              child: FlutterLogo(),
            ),
            Text(
              this.viewModel.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: this.presenter.onPlusTap,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void incrementCounter() {
    this.viewModel.counter++;
  }

  @override
  void createAnimations() {
    this.animationControllers = {
      this.viewModel.triggerAnimation1: AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      )
    };

    this.viewModel.animation = Tween<double>(
      begin: 50,
      end: 300,
    ).animate(this.animationControllers.values.first)
      ..addListener(() => this.refreshView());
  }
}
