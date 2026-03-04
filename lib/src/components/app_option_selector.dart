import 'package:flutter/material.dart';

class AppOptionSelector extends StatelessWidget {
  final bool selected;
  final Color activeColor;
  final Color inactiveColor;

  const AppOptionSelector({
    super.key,
    required this.selected,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? activeColor : inactiveColor,
          width: 2,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activeColor,
                ),
              ),
            )
          : null,
    );
  }
}
