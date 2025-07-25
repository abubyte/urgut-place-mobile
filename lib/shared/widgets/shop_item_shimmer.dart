import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShopItemShimmer extends StatelessWidget {
  const ShopItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 6),
                    Container(height: 14, width: 100, color: Colors.white), // name
                    SizedBox(height: 4),
                    Row(
                      children: List.generate(
                        5,
                        (_) => Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Container(width: 14, height: 14, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(height: 12, width: 120, color: Colors.white), // work time
                    SizedBox(height: 8),
                    Container(
                      height: 36,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    ), // button
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
