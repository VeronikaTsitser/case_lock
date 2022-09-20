import 'dart:math';
import 'package:flutter/material.dart';

class GameBoardNotifier extends ChangeNotifier {
  late List<List<bool>> _mainThing;
  late int _length;

  GameBoardNotifier() {
    setLength(3);
  }

  List<List<bool>> get mainThing => _mainThing;
  int get length => _length;

  void setLength(int length) {
    _length = length;
    _updateMainThing();
  }

  void _updateMainThing() {
    _mainThing = List.generate(
      _length,
      (axisY) => List.generate(
        _length,
        (axisX) {
          return true;
        },
      ),
    );
    notifyListeners();
  }

  void onKeyTap(int axisY, int axisX) {
    for (var targetAxisY = 0; targetAxisY < _length; targetAxisY++) {
      // var rowKeys = mainThing[targetAxisY];
      for (var targetAxisX = 0; targetAxisX < _length; targetAxisX++) {
        if (targetAxisX == axisX || targetAxisY == axisY) {
          _mainThing[targetAxisY][targetAxisX] =
              !_mainThing[targetAxisY][targetAxisX];
        }
      }
    }
    notifyListeners();
  }

  void mixUp() {
    for (var i = 0; i < 4; i++) {
      int randomY = Random().nextInt(length);
      int randomX = Random().nextInt(length);

      onKeyTap(randomY, randomX);
    }
    notifyListeners();
  }

  bool checkWin() {
    for (var targetAxisY = 0; targetAxisY < _length; targetAxisY++) {
      for (var targetAxisX = 0; targetAxisX < _length; targetAxisX++) {
        if (_mainThing[targetAxisY][targetAxisX] != _mainThing[0][0]) {
          return false;
        }
      }
    }
    return true;
  }

  void openChest(AnimationController animationController) {
    final isWon = checkWin();
    if (isWon) {
      animationController
        ..duration = const Duration(seconds: 5)
        ..animationBehavior
        ..forward()
        ..addListener(
          () {
            if (animationController.value > 0.7) {
              animationController.stop();
            }
          },
        );
    }
  }
}
