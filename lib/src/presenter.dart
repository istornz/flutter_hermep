import 'page.dart';

/// contain the data logic & present it to view
abstract class HermepPresenter<M, I> {
  late M viewModel;
  late I viewInterface;

  /// initialize data
  void init();

  /// dispose the presenter
  void dispose();

  /// refresh the view
  void refreshView() {
    (this.viewInterface as HermepPage).refreshView();
  }
}
