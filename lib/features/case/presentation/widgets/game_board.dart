import 'package:case_lock/features/case/logic/animation_controller_notifier.dart';
import 'package:case_lock/features/case/logic/game_board_notifier.dart';
import 'package:case_lock/features/case/presentation/widgets/game_board_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.67;
    final animationNotifier =
        Provider.of<AnimationControllerNotifier>(context, listen: false);
    return Consumer<GameBoardNotifier>(
      builder: (_, notifier, __) {
        final itemHeight = width / notifier.length;
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset('assets/images/board.png'),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 0.3),
              width: width,
              height: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  notifier.length,
                  (axisY) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      notifier.length,
                      (axisX) => GameBoardItem(
                        onPressed: () {
                          if (animationNotifier.isOpen) {
                            animationNotifier.closeChest();
                          }
                          notifier.onKeyTap(axisY, axisX);
                        },
                        itemHeight: itemHeight,
                        isHorizontal: notifier.mainThing[axisY][axisX],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
