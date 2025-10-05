import 'package:flutter/widgets.dart';
import 'package:shops/core/utils/formatters.dart';

extension FormatExtension on String {
  String formatPhone() {
    return PhoneNumberFormatter.format(this);
  }
}

extension Gap on int {
  Widget get h => SizedBox(height: (this).toDouble());
  Widget get w => SizedBox(width: (this).toDouble());
  BorderRadius get r => BorderRadius.circular((this).toDouble());
}

extension SnakeCaseExtension on String {
  String toSnakeCase() {
    return replaceAllMapped(
      RegExp(r'([A-Z])'),
      (match) => '_${match[0]!.toLowerCase()}',
    ).replaceAll(RegExp(r'^_'), '');
  }
}
