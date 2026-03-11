import 'package:dmtestes/src/core/app_color.dart';
import 'package:flutter/material.dart';
//import 'package:linear_progress_bar/linear_progress_bar.dart';

class AppProgressBar extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestion;
  final double progress;
  //final DmSemanticColor progressColors;

  const AppProgressBar({
    super.key,
    //required this.progressColors,
    required this.currentQuestion,
    required this.totalQuestion,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    //final progress = currentQuestion / totalQuestion;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Text(
            '$currentQuestion / $totalQuestion',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                height: 8,

                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E5E5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          width: constraints.maxWidth * progress,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2ECC40),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
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
