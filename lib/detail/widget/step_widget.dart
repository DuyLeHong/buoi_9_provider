import 'package:flutter/material.dart';

class StepWidget extends StatelessWidget {
  const StepWidget({Key? key, required this.step, required this.content})
      : super(key: key);
  final int step;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          elevation: 1,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Text(
              '$step',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Flexible(
          child: Text(
            content,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              height: 2,
            ),
          ),
        ),
      ],
    );
  }
}
