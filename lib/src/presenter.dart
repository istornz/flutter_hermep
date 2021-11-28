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
  void refreshView({bool? force, void Function()? fn}) {
    (this.viewInterface as HermepPage).refreshView(
      force: force,
      fn: fn,
    );
  }
}
