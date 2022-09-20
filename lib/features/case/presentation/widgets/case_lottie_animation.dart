import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class CaseLottieAnimation extends StatefulWidget {
  const CaseLottieAnimation({Key? key, required this.onCreated})
      : super(key: key);
  final void Function(AnimationController controller) onCreated;

  @override
  State<CaseLottieAnimation> createState() => _CaseLottieAnimationState();
}

class _CaseLottieAnimationState extends State<CaseLottieAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    widget.onCreated(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Lottie.asset(
          'assets/lottie_animation/case_lottie.json',
          width: 200,
          height: 200,
          fit: BoxFit.fill,
          controller: _controller,
        ),
      ),
    );
  }
}
