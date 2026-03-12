import 'package:dmtestes/src/core/app_color.dart';
import 'package:flutter/material.dart';
import 'app_option_selector.dart';

class AppAnswerCard extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;
  final DmSemanticColor colors;

  const AppAnswerCard({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: selected ? colors.brandPrimary50 : colors.backgroundSecondary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? colors.brandPrimary50 : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            AppOptionSelector(isSelected: selected, label: 'eu', onTap: onTap),
            const SizedBox(width: 12),
            Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
          ],
        ),
      ),
    );
  }
}
