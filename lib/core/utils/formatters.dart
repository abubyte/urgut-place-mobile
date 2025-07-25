import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:urgut_please/core/utils/utils.dart';

abstract class Formatters extends Utils {}

class PhoneNumberFormatter extends Formatters {
  static final inputFormatter = MaskTextInputFormatter(mask: '+998 (##) ### ## ##', filter: {"#": RegExp(r'[0-9]')});

  static String format(String value) {
    if (value.isEmpty) return '';

    // Remove all non-digit characters
    String digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    // Remove +998 prefix if present
    if (digitsOnly.startsWith('998') && digitsOnly.length >= 3) {
      digitsOnly = digitsOnly.substring(3);
    }

    // Ensure we have at most 9 digits for the local number
    if (digitsOnly.length > 9) {
      digitsOnly = digitsOnly.substring(0, 9);
    }

    // Apply the mask format
    if (digitsOnly.isEmpty) return '+998';

    String formatted = '+998';

    if (digitsOnly.isNotEmpty) {
      formatted += ' (${digitsOnly.substring(0, digitsOnly.length >= 2 ? 2 : digitsOnly.length)}';

      if (digitsOnly.length >= 2) {
        formatted += ')';

        if (digitsOnly.length >= 3) {
          int remainingStart = 2;
          int remainingLength = digitsOnly.length - 2;
          String remaining = digitsOnly.substring(remainingStart);

          formatted += ' ';

          // Add first group (3 digits)
          if (remainingLength >= 1) {
            formatted += remaining.substring(0, remainingLength >= 3 ? 3 : remainingLength);

            if (remainingLength >= 3) {
              formatted += ' ';

              // Add second group (2 digits)
              if (remainingLength >= 4) {
                int secondGroupLength = remainingLength >= 5 ? 2 : remainingLength - 3;
                formatted += remaining.substring(3, 3 + secondGroupLength);

                if (remainingLength >= 5) {
                  formatted += ' ';

                  // Add third group (2 digits)
                  if (remainingLength >= 6) {
                    int thirdGroupLength = remainingLength >= 7 ? 2 : remainingLength - 5;
                    formatted += remaining.substring(5, 5 + thirdGroupLength);
                  }
                }
              }
            }
          }
        }
      }
    }

    return formatted;
  }

  parse(String value) {
    return '';
  }
}

class PriceFormatter extends Formatters {
  final inputFormatter = MaskTextInputFormatter(mask: '### ### ### so\'m', filter: {"#": RegExp(r'[0-9]')});
}
