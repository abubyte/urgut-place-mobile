import 'package:flutter/widgets.dart';
import 'package:urgut_please/core/utils/formatters.dart';

extension FormatExtension on String {
  String formatPrice() {
    return PhoneNumberFormatter.format(this);
  }

  String parsePrice() {
    return PhoneNumberFormatter.parse(this);
  }
}

extension Gap on int {
  Widget get h => SizedBox(height: (this).toDouble());
  Widget get w => SizedBox(width: (this).toDouble());
  BorderRadius get r => BorderRadius.circular((this).toDouble());
}
