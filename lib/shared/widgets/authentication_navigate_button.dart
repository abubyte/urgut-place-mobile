import 'package:flutter/material.dart';

class AuthenticationNavigateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;
  final String buttonText;

  const AuthenticationNavigateButton({super.key, required this.onPressed, this.text, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (text != null)
          Text(
            text!,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonText, style: TextStyle(color: Color(0xFFF26B6C), fontSize: 14)),
        ),
      ],
    );
  }
}
