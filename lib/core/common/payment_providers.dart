import 'package:flutter/widgets.dart';

class PaymentProvider {
  final IconData icon; // path to asset icon
  final String title;
  final String description;

  const PaymentProvider({
    required this.icon,
    required this.title,
    required this.description,
  });
}