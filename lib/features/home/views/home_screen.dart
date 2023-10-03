import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../scan/scan.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = '/HomeScreen_screen';
  static void open(BuildContext context) => Navigator.pushNamed(context, route);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    /// whenever your initialization is completed, remove the splash screen:
    Future.delayed(const Duration(seconds: 2))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Group 27.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 550.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => ScanScreen.open(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[900],
                minimumSize: const Size(200, 50),
                shape: const StadiumBorder(),
                padding: const EdgeInsets.all(16),
              ),
              child: const Text(
                'Scan QR Code',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Scan QR Code'))
          ],
        ),
      ),
    );
  }
}
