import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'presenter.dart';

/// the view interface to call all view logic
abstract class HermepView {}

/// create a MVVM pattern page
abstract class HermepPage<M, P, W extends StatefulWidget> extends State<W> {
  /// contain all animation controllers mapped with
  /// the value notifier associated to launch/stop the animation
  late Map<ValueNotifier<bool>, AnimationController> animationControllers;

  /// presenter which contain all the logical method to present in the view
  late P presenter;

  /// view model which contain all data arguments related to your view
  late M viewModel;

  /// create your presenter inside this method
  HermepPresenter createPresenter();

  /// create all your animations here and assign them to ```animationControllers```
  void createAnimations();

  /// called after the view was rendered
  void afterViewInit();

  @override
  void dispose() {
    this.disposePage();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    this._initPage(this.createPresenter());
    this.createAnimations();
    this._initAnimations();
    WidgetsBinding.instance!.addPostFrameCallback((_) => afterViewInit());
  }

  /// page initializer which create & assign view model & presenter
  void _initPage(HermepPresenter presenter) {
    presenter.init();
    this.viewModel = presenter.viewModel;
    this.presenter = presenter as P;
    this.animationControllers = {};
  }

  /// init all the animation controllers
  void _initAnimations() {
    this.animationControllers.forEach((notifier, animation) {
      notifier.addListener(() {
        if (notifier.value) {
          animation.forward();
        } else {
          animation.reverse();
        }
      });
    });
  }

  /// called when page has been disposed
  /// all animation controllers was disposed
  void disposePage() {
    (this.presenter as HermepPresenter).dispose();
    this.animationControllers.forEach((notifier, animation) {
      notifier.dispose();
      animation.dispose();
    });
  }

  /// refresh the page view only if widget is mounted
  /// use force to force refresh even if widget is alreay mounted
  void refreshView({bool? force, void Function()? fn}) {
    if (!mounted || (force != null && !force)) {
      return;
    }

    setState(fn ?? () {});
  }
}
