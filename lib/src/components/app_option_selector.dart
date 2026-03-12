import 'package:flutter/material.dart';

class AppOptionSelector extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const AppOptionSelector({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F5E9) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? const Color(0XFF28a745)
                : const Color(0xFFE0E0E0),
            width: isSelected ? 2 : 1,
          ),
        ),

        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),

              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0XFF28a745)
                      : const Color(0xFFBDBDBD),
                  width: 2,
                ),
                color: Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0XFF28a745),
                        ),
                      ),
                    )
                  : null,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
