import 'package:flutter/material.dart';
import 'package:shopbox_pos/core/common/payment_providers.dart';

class AppSettings {
  static String appName = 'Shopbox';
  static int defaultPageLimit = 20;
  static final List<PaymentProvider> paymentProviders = [
    PaymentProvider(
      icon: Icons.attach_money,
      title: 'Cash Payment',
      description: 'Pay with cash at the counter.',
    ),
    PaymentProvider(
      icon: Icons.credit_card,
      title: 'Card Payment',
      description: 'Pay with credit or debit card',
    ),
    PaymentProvider(
      icon: Icons.card_giftcard,
      title: 'Voucher',
      description: 'Redeem your voucher code',
    ),
  ];
}
