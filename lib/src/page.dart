import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'presenter.dart';

abstract class HermepView {}

abstract class HermepPage<M, P> extends State {
  late Map<ValueNotifier<bool>, AnimationController> animationControllers;
  late P presenter;
  late M viewModel;

  HermepPresenter createPresenter();
  void createAnimations();

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
  }

  void _initPage(HermepPresenter presenter) {
    presenter.init();
    this.viewModel = presenter.viewModel;
    this.presenter = presenter as P;
    this.animationControllers = {};
  }

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

  void disposePage() {
    (this.presenter as HermepPresenter).dispose();
    this.animationControllers.forEach((notifier, animation) {
      notifier.dispose();
      animation.dispose();
    });
  }

  void refreshView() => setState(() {});
}
