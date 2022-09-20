import 'package:flutter/material.dart';

class AnimationControllerNotifier {
  AnimationController? _controller;

  AnimationController get controller => _controller!;

  void setController(AnimationController animationController) {
    _controller ??= animationController;
  }
}
