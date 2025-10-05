import 'package:flutter/material.dart';
import 'package:shops/core/utils/extensions.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, this.label, required this.onPressed, this.loading = false});

  final String? label;
  final VoidCallback? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          height: 43,
          width: 200,
          decoration: BoxDecoration(borderRadius: 200.r, color: Color(0xFFF26B6C)),
          child: Center(
            child: loading
                ? AspectRatio(aspectRatio: 1, child: CircularProgressIndicator())
                : Text(
                    label ?? "Tasdiqlash",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                  ),
          ),
        ),
      ),
    );
  }
}
