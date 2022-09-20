import 'package:case_lock/core/presentation/app_theme.dart';
import 'package:case_lock/features/case/logic/animation_controller_notifier.dart';
import 'package:case_lock/features/case/logic/game_board_notifier.dart';
import 'package:case_lock/features/case/presentation/case_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return GameBoardNotifier();
          },
        ),
        Provider(
          create: (BuildContext context) {
            return AnimationControllerNotifier();
          },
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        home: const CaseScreen(),
      ),
    );
  }
}
