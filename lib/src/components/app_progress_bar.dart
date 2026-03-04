import 'package:dmtestes/src/core/app_color.dart';
import 'package:flutter/material.dart';
//import 'package:linear_progress_bar/linear_progress_bar.dart';

class AppProgressBar extends StatelessWidget {
  final int current;
  final int total;
  final DmSemanticColor progressColors;

  const AppProgressBar({
    super.key,
    required this.progressColors,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final progress = current / total;

    return Row(
      children: [
        Text(
          '$current / $total',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
        ),
      ],
    );

    /*   return LinearProgressBar(
  maxSteps: 6,
  progressType: ProgressType.linear,
  currentStep: 3,
  progressColor: Colors.blue,
  backgroundColor: Colors.grey,
  borderRadius: BorderRadius.circular(10),
  minHeight: 12,
); */
  }
}
