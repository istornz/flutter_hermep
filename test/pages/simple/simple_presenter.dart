import 'package:hermep/hermep.dart';

import 'simple.dart';
import 'simple_model.dart';

class SimplePresenter with HermepPresenter<SimpleModel, SimpleView> {
  SimplePresenter(
    SimpleView viewInterface,
  ) {
    this.viewModel = SimpleModel();
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