import 'package:dmtestes/src/core/app_color.dart';
import 'package:flutter/material.dart';

class AppQuestionCard extends StatelessWidget {
  final String question;
  final DmSemanticColor colors;

  const AppQuestionCard({
    super.key,
    required this.question,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        question,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
