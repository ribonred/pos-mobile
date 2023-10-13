import 'package:flutter/material.dart';

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => onChanged(value),
        child: Row(
          children: [
            _customRadioButton,
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color.fromARGB(255, 255, 122, 0) : null,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected
              ? const Color.fromARGB(255, 255, 122, 0)
              : const Color.fromARGB(255, 157, 157, 157),
          width: 1,
        ),
      ),
      child: Text(
        leading,
        style: TextStyle(
          color: isSelected
              ? Colors.white
              : const Color.fromARGB(255, 157, 157, 157),
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }
}
