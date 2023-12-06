import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../services/database.dart';
import '../../../utils/colors.dart';
import '../../pages.dart';

class SuccessPage extends StatefulWidget {
  static const String routeName = '/success';

  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  final DatabaseServices db = Get.find();

  int countdown = 3;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (countdown == 0) {
          timer.cancel();

          db.clearSession().then((_) => Get.offAllNamed(WelcomePage.routeName));
        }
        setState(() => countdown--);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryOrange,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ScaleTransition(
              scale: const AlwaysStoppedAnimation<double>(1.2),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white24,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ScaleTransition(
              scale: const AlwaysStoppedAnimation<double>(0.9),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white24,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Material(
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Icon(
                  Icons.check,
                  color: AppColors.primaryOrange,
                  size: Get.width * 0.4,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: Get.width * 0.6,
              height: Get.width * 0.6,
              child: CircularProgressIndicator(
                value: countdown / 3,
                strokeWidth: 16.0,
                color: AppColors.primaryOrange,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Payment successful',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  const Spacing.small(),
                  Text(
                    'You have successfully paid for your order',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
