import 'package:flutter/material.dart';

class AnimationControllerNotifier {
  AnimationController? _controller;
  bool _isOpen = false;
  bool get isOpen => _isOpen;

  AnimationController get controller => _controller!;

  void setController(AnimationController animationController) {
    _controller ??= animationController;
  }

  void closeChest() {
    if (_controller != null) {
      _controller!.reset();
      _isOpen = false;
    }
  }

  void openChest() {
    if (_controller != null) {
      _isOpen = true;
      _controller!
        ..duration = const Duration(seconds: 5)
        ..animationBehavior
        ..forward()
        ..addListener(
          () {
            if (_controller!.value > 0.7) {
              _controller!.stop();
            }
          },
        );
    }
  }
}
