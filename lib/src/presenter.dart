import 'page.dart';

abstract class HermepPresenter<M, I> {
  late M viewModel;
  late I viewInterface;

  void init();
  void dispose();
  void refreshView() {
    (this.viewInterface as HermepPage).refreshView();
  }
}
