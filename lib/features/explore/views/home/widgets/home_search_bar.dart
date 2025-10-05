import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shops/config/app_routes.dart';
import 'package:shops/features/explore/viewmodels/like/like_bloc.dart';
import 'package:shops/features/explore/viewmodels/like/like_event.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.go(Routes.search),
          child: Container(
            width: MediaQuery.of(context).size.width - 80,
            height: 43,
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha((255 * 0.4).toInt()),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Qidirish", style: TextStyle(color: Colors.black38)),
                  Icon(Icons.search, color: Colors.black38),
                ],
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<LikeBloc>().add(GetLikes());
            context.go(Routes.like);
          },
          icon: Icon(Icons.favorite_outline, size: 24),
        ),
      ],
    );
  }
}
