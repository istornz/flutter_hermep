import 'package:flutter/material.dart';
import 'package:hermep/hermep.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hermep Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

/* MODEL */
class HomeModel with HermepModel {
  late int counter;
}

/* PRESENTER */
class HomePresenter with HermepPresenter<HomeModel, HomeView> {
  HomePresenter(
    HomeView viewInterface,
  ) {
    this.viewModel = HomeModel();
    this.viewInterface = viewInterface;
  }

  @override
  void dispose() {}

  @override
  void init() {
    this.viewModel.counter = 0;
  }

  onPlusTap() {
    this.viewInterface.incrementCounter();
    this.refreshView();
  }
}

/* PAGE VIEW */
abstract class HomeView {
  void incrementCounter();
}

/* PAGE */
class HomePage extends StatefulWidget {
  HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends HermepPage<HomeModel, HomePresenter> with HomeView {
  @override
  void createAnimations() { }

  @override
  HermepPresenter createPresenter() => HomePresenter(this);

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
            Text(
              this.viewModel.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
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