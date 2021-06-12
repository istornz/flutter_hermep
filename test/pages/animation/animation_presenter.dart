import 'package:flutter/material.dart';
import 'package:hermep/hermep.dart';

import 'animation.dart';
import 'animation_model.dart';

class AnimationPresenter with HermepPresenter<AnimationModel, AnimationView> {
  AnimationPresenter(
    AnimationView viewInterface,
  ) {
    this.viewModel = AnimationModel();
    this.viewInterface = viewInterface;
  }

  @override
  void dispose() {}

  @override
  void init() {
    this.viewModel.triggerAnimation1 = new ValueNotifier(false);
    this.viewModel.counter = 0;
  }

  onPlusTap() {
    this.viewInterface.incrementCounter();
    this.refreshView();
    this.viewModel.triggerAnimation1.value = !this.viewModel.triggerAnimation1.value;
  }
}
