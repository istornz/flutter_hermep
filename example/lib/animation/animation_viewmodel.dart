import 'package:flutter/material.dart';
import 'package:hermep/hermep.dart';

class AnimationModel with HermepModel {
  late int counter;
  late ValueNotifier<bool> triggerAnimation1;
  late Animation<double> animation;

  AnimationModel();
}
