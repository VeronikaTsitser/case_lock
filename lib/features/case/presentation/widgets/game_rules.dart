import 'package:flutter/material.dart';

class GameRules extends StatelessWidget {
  const GameRules({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    width: MediaQuery.of(context).size.width,
                    'assets/images/rule_board.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.6,
                    // height: MediaQuery.of(context).size.height / 3,
                    color: const Color.fromRGBO(255, 255, 255, 0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        ''' Rules \n     There are a lot of turnable keys on the board. \n     There is one rule - when you turn the key, all the keys turn in one row and in one column. \n    The safe opens only if you place all the keys parallel to each other (all vertically or all horizontally) and tap "Open chest". ''',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      icon: const Icon(
        Icons.info_outlined,
      ),
    );
  }
}
