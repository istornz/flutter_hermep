import 'package:flutter_test/flutter_test.dart';

import 'utils/pages/simple/simple.dart';
import 'utils/pages/simple/simple_presenter.dart';

class SimpleViewTest with SimpleView {
  @override
  void incrementCounter() {}
}

void main() {
  test('should init model', () {
    SimpleView simpleView = new SimpleViewTest();
    SimplePresenter simplePresenter = SimplePresenter(simpleView);
    simplePresenter.init();
    expect(simplePresenter.viewModel.counter, 0);
  });
}
