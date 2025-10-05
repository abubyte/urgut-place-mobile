import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUi {
  static void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 18,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Color(0xFF4CE93E),
      textColor: Colors.white,
    );
  }

  static void showError({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 18,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Color(0xFFFF4040),
      textColor: Colors.white,
    );
  }
}
