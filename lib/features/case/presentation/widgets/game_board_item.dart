import 'dart:math';

import 'package:flutter/material.dart';

class GameBoardItem extends StatelessWidget {
  const GameBoardItem(
      {super.key,
      required this.itemHeight,
      required this.isHorizontal,
      required this.onPressed});
  final double itemHeight;
  final bool isHorizontal;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(3),
        height: itemHeight,
        width: itemHeight,
        child: Transform.rotate(
          angle: (isHorizontal) ? 0 : pi / 180 * 90,
          child: Image.asset('assets/images/key.png'),
        ),
      ),
    );
  }
}
