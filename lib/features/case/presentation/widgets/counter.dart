import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });
  final int initialValue;
  final void Function(int n) onChanged;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int count;

  @override
  void initState() {
    count = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (count > 2) {
                count = count - 1;
                widget.onChanged(count);
              }
            });
          },
          icon: (count > 2)
              ? const Icon(Icons.remove)
              : Icon(
                  Icons.remove,
                  color: Colors.grey[600],
                ),
        ),
        Text(
          '$count',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              if (count < 10) {
                count = count + 1;
                widget.onChanged(count);
              }
            });
          },
          icon: (count < 10)
              ? const Icon(Icons.add)
              : Icon(
                  Icons.add,
                  color: Colors.grey[600],
                ),
        ),
        const Text(
          'Choose a level',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
