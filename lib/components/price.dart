import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Price extends StatelessWidget {
  final dynamic amount;
  final String symbol;
  final TextStyle? style;

  const Price(this.amount, {super.key, this.symbol = 'Rp. ', this.style});

  @override
  Widget build(BuildContext context) {
    final decimalFormat = NumberFormat.decimalPattern('id_ID');

    dynamic amount = this.amount;
    if (amount is String) {
      amount = decimalFormat.parse(this.amount);
    }

    return Text.rich(
      TextSpan(
        text: symbol,
        children: [
          TextSpan(
            text: decimalFormat.format(amount),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      style: style ?? Theme.of(context).textTheme.titleLarge,
    );
  }
}
