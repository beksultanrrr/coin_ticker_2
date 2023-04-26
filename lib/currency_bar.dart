import 'package:flutter/material.dart';

class CurrencyBar extends StatelessWidget {
  const CurrencyBar({
    super.key,
    required this.priceCurrency,
    required this.selectedCurrency,
    required this.firstCurrency,
    required this.secondtCurrency
  });

  final String? priceCurrency;
  final String selectedCurrency;
  final String? firstCurrency;
  final String? secondtCurrency;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
      child: Text(
        '1 BTC = $priceCurrency $selectedCurrency',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
