import 'package:flutter/widgets.dart';

import 'page.dart';

/// contain the data logic & present it to view
mixin HermepPresenter<M, I> {
  late M viewModel;
  late I viewInterface;

  get _hermepViewInterface => (this.viewInterface as HermepPage);

  /// initialize data
  void init();

  /// dispose the presenter
  void dispose();

  /// get page context
  BuildContext get context => _hermepViewInterface.context;

  /// get page mounted
  bool get mounted => _hermepViewInterface.mounted;

  /// refresh the view
  void refreshView({bool? force, void Function()? fn}) {
    (this.viewInterface as HermepPage).refreshView(
      force: force,
      fn: fn,
    );
  }
}
