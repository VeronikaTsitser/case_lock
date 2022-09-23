import 'package:case_lock/features/case/presentation/widgets/counter.dart';
import 'package:flutter/material.dart';

class LevelChange extends StatefulWidget {
  const LevelChange(
      {super.key, required this.onChanged, required this.initialValue});
  final void Function(int value) onChanged;
  final int initialValue;

  @override
  State<LevelChange> createState() => _LevelChangeState();
}

class _LevelChangeState extends State<LevelChange> {
  bool visible = false;
  late int value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (!visible) {
                visible = !visible;
              } else {
                visible = !visible;
                if (value != widget.initialValue) {
                  widget.onChanged(value);
                }
              }
            });
          },
          icon: !visible ? const Icon(Icons.whatshot) : const Icon(Icons.done),
        ),
        Visibility(
          visible: visible,
          child: Counter(
            initialValue: value,
            onChanged: (int n) {
              value = n;
            },
          ),
        )
      ],
    );
  }
}
