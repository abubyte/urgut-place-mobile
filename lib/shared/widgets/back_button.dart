import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:shops/core/utils/extensions.dart';

class ADBackButton extends StatelessWidget {
  const ADBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Feather.arrow_left, color: Color(0xff787878), size: 24, weight: .5),
          4.w,
          Text(
            "Orqaga",
            style: TextStyle(color: Color(0xff787878), fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
