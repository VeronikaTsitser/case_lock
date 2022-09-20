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
    // _controller.repeat(period: const Duration(seconds: 5));
    // _controller.
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Lottie.asset(
          'assets/lottie_animation/case_lottie.json',
          width: 200,
          height: 200,
          fit: BoxFit.fill,
          controller: _controller,
          // onLoaded: (composition) {
          //   _controller
          //     ..duration = const Duration(seconds: 5)
          //     ..animationBehavior
          //     ..forward();
          // },
        ),
      ],
    );
  }
}
