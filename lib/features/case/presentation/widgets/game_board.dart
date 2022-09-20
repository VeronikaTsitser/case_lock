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
    final double width = MediaQuery.of(context).size.width * 0.7;
    final double height = MediaQuery.of(context).size.height * 0.32;
    return Consumer<GameBoardNotifier>(
      builder: (BuildContext context, value, Widget? child) {
        final itemHeight = height / value.length;
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset('assets/images/board.png'),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 0.3),
              width: width,
              height: height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  value.length,
                  (axisY) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      value.length,
                      (axisX) => GameBoardItem(
                        onPressed: () {
                          if (Provider.of<GameBoardNotifier>(context,
                                  listen: false)
                              .isOpen) {
                            Provider.of<AnimationControllerNotifier>(context,
                                    listen: false)
                                .controller
                                .reset();
                          }
                          value.onKeyTap(axisY, axisX);
                        },
                        itemHeight: itemHeight,
                        isHorizontal: value.mainThing[axisY][axisX],
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
