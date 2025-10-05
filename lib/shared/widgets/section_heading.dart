import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const SectionHeading({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: Color(0xFF4F4F4F), fontSize: 20, fontWeight: FontWeight.w700),
        ),
        onPressed != null
            ? TextButton(
                onPressed: onPressed,
                child: Text(
                  "Barchasi",
                  style: TextStyle(color: Color(0xFFF26B6C), fontWeight: FontWeight.w700, fontSize: 12),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
