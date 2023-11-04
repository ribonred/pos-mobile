import 'package:flutter/material.dart';

class MainPageContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const MainPageContainer(
      {Key? key, required this.child, this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: child,
    );
  }
}
