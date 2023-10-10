import 'package:flutter/material.dart';

enum PrimaryButtonType {
  primary,
  secondary,
  other,
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text('test'));
  }
}
