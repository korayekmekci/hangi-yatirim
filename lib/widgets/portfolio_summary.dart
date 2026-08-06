import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PortfolioSummary extends StatelessWidget {
  final double total;

  const PortfolioSummary({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
      locale: "tr_TR",
      symbol: "₺",
      decimalDigits: 2,
    );

    return Card(
      elevation: 6,
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 30,
        ),
        child: Column(
          children: [
            const Text(
              "Toplam Portföy",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              formatter.format(total),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}