import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset('assets/images/tablet.png'),
        Text(
          "Pilot brothers's safe",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
