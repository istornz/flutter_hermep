import 'package:flutter/widgets.dart';

import 'page.dart';

/// contain the data logic & present it to view
mixin HermepPresenter<M, I> {
  late M viewModel;
  late I viewInterface;

  /// initialize data
  void init();

  /// dispose the presenter
  void dispose();

  /// get page context
  BuildContext get context => (this.viewInterface as HermepPage).context;

  // get page mounted
  bool get mounted => (this.viewInterface as HermepPage).mounted;

  /// refresh the view
  void refreshView({bool? force, void Function()? fn}) {
    (this.viewInterface as HermepPage).refreshView(
      force: force,
      fn: fn,
    );
  }
}
