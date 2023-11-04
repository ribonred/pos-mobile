import 'package:flutter/material.dart';

class UnknownRoutePage extends StatelessWidget {
  final String namePage;
  const UnknownRoutePage({
    Key? key,
    required this.namePage,
  }) : super(key: key);
  static void open(BuildContext context, {required String argument}) =>
      Navigator.pushNamed(context, route, arguments: argument);
  static const String route = '/not_found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: Text('No route defined for $namePage')) /*Container()*/,
    );
  }
}
