import 'package:case_lock/features/case/logic/game_board_notifier.dart';

import 'package:case_lock/features/case/presentation/widgets/case_lottie_animation.dart';
import 'package:case_lock/features/case/presentation/widgets/game_board.dart';
import 'package:case_lock/features/case/presentation/widgets/game_rules.dart';
import 'package:case_lock/features/case/presentation/widgets/level_change.dart';
import 'package:case_lock/features/case/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaseScreen extends StatefulWidget {
  const CaseScreen({Key? key}) : super(key: key);

  @override
  State<CaseScreen> createState() => _CaseScreenState();
}

class _CaseScreenState extends State<CaseScreen> {
  late final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(8, 55, 82, 1),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TopBar(),
                  Center(
                    child: CaseLottieAnimation(
                      onCreated: (controller) {
                        animationController = controller;
                      },
                    ),
                  ),
                  const GameBoard(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<GameBoardNotifier>(context, listen: false)
                              .openChest(animationController);
                        },
                        child: const Text(
                          'Open chest',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          animationController.reset();
                          Provider.of<GameBoardNotifier>(context, listen: false)
                              .mixUp();
                        },
                        child: const Text(
                          'Mix up',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      const GameRules(),
                      LevelChange(
                        initialValue: Provider.of<GameBoardNotifier>(context,
                                listen: false)
                            .length,
                        onChanged: (int value) {
                          Provider.of<GameBoardNotifier>(context, listen: false)
                              .setLength(value);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
