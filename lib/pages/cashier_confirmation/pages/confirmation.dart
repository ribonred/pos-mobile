import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../utils/colors.dart';

class CashierConfirmationPage extends StatelessWidget {
  static const String routeName = '/cashier-confirmation';

  const CashierConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryOrange,
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: GlowWidget(
              icon: Icons.hourglass_bottom_rounded,
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
                    'Waiting for cashier approval...',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  const Spacing.small(),
                  Text(
                    'cashier will check and approve your order',
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

class GlowWidget extends StatefulWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color glowColor;
  final IconData icon;

  const GlowWidget({
    super.key,
    this.backgroundColor = AppColors.primaryOrange,
    this.foregroundColor = Colors.white,
    this.glowColor = AppColors.primaryOrange,
    this.icon = Icons.check,
  });

  @override
  State<GlowWidget> createState() => _GlowWidgetState();
}

class _GlowWidgetState extends State<GlowWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
  )..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(
          Duration(milliseconds: _controller.value == 0 ? 500 : 0),
          () => _controller.repeat(),
        );
      }
    });

  late final Animation<double> _scaleAnimation =
      Tween<double>(begin: 0.6, end: 1.5).animate(_controller);
  late final Animation<double> _fadeAnimation =
      Tween<double>(begin: .9, end: 0).animate(_controller);

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: Get.width * 1.5,
              height: Get.width * 1.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.glowColor,
              ),
            ),
          ),
        ),
        Material(
          shape: const CircleBorder(),
          color: widget.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Icon(
              widget.icon,
              color: widget.foregroundColor,
              size: Get.width * 0.4,
            ),
          ),
        ),
      ],
    );
  }
}
