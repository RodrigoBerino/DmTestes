import 'package:dmtestes/src/core/app_color.dart';
//import 'package:dmtestes/src/core/app_type.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  final IconData icon;

  ///final VoidCallback? onBack;
  final DmSemanticColor colors;

  const AppHeader({
    super.key,
    required this.label,
    required this.icon,
    required this.colors,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  Widget build(BuildContext context) {
    return Container(
      color: colors.backgroundHeader,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  iconSize: 24,
                  icon: Icon(Icons.arrow_back, color: colors.brandPrimary10),
                ),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: TextStyle(
                    color: colors.textBtn,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
