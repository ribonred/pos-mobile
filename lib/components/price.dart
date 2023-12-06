import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Price extends StatelessWidget {
  final dynamic amount;
  final String symbol;
  final TextStyle? style;
  final bool? usdFormat;

  const Price(
    this.amount, {
    super.key,
    this.symbol = 'Rp. ',
    this.style,
    this.usdFormat = true,
  });

  @override
  Widget build(BuildContext context) {
    dynamic amount = this.amount;
    NumberFormat parseDecimalFormat = NumberFormat.decimalPattern('id_ID');
    NumberFormat outputDecimalFormat = NumberFormat.decimalPattern('id_ID');

    if (usdFormat == true) {
      parseDecimalFormat = NumberFormat.decimalPattern('en_US');
    }

    if (amount is String) {
      amount = parseDecimalFormat.parse(this.amount);
    }

    return Text.rich(
      TextSpan(
        text: symbol,
        children: [
          TextSpan(
            text: outputDecimalFormat.format(amount),
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
