import 'package:case_lock/features/case/logic/animation_controller_notifier.dart';
import 'package:case_lock/features/case/logic/game_board_notifier.dart';
import 'package:case_lock/features/case/presentation/widgets/case_lottie_animation.dart';
import 'package:case_lock/features/case/presentation/widgets/game_board.dart';
import 'package:case_lock/features/case/presentation/widgets/game_rules.dart';
import 'package:case_lock/features/case/presentation/widgets/level_change.dart';
import 'package:case_lock/features/case/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaseScreen extends StatelessWidget {
  const CaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationNotifier =
        Provider.of<AnimationControllerNotifier>(context, listen: false);
    final gameBoardNotifier =
        Provider.of<GameBoardNotifier>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(8, 55, 82, 1),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TopBar(),
                  Center(
                    child: CaseLottieAnimation(
                      onCreated: animationNotifier.setController,
                    ),
                  ),
                  const GameBoard(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (gameBoardNotifier.isWon) {
                            animationNotifier.openChest();
                          }
                        },
                        child: const Text('Open chest'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          animationNotifier.closeChest();
                          gameBoardNotifier.mixUp();
                        },
                        child: const Text('Mix up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      const GameRules(),
                      LevelChange(
                        initialValue: gameBoardNotifier.length,
                        onChanged: (int value) {
                          gameBoardNotifier
                            ..setLength(value)
                            ..mixUp();
                          animationNotifier.closeChest();
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
