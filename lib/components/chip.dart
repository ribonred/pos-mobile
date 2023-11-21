import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const AppChip({
    super.key,
    required this.label,
    required this.onSelected,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InputChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(64.0),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      color: MaterialStateProperty.resolveWith(getColor),
      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black54,
      ),
      selected: selected,
      showCheckmark: false,
      label: Text(label),
      onPressed: onSelected,
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.primaryOrange;
    }
    return Colors.white;
  }
}
