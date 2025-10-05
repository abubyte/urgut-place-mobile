import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shops/core/utils/extensions.dart';
import 'package:shops/features/explore/viewmodels/like/like_bloc.dart';
import 'package:shops/features/explore/viewmodels/like/like_event.dart';
import 'package:shops/features/explore/views/shop/shop_screen.dart';
import 'package:shops/shared/models/shop/shop_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({super.key, required this.shop});

  final ShopModel shop;

  @override
  Widget build(BuildContext context) {
    final likeBloc = BlocProvider.of<LikeBloc>(context, listen: true);
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ShopScreen(shop: shop))),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 1, color: Colors.black.withAlpha((255 * .08).toInt()))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Stack(
                    children: [
                      // Image with CachedNetworkImage and shimmer
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: shop.imageUrls.isNotEmpty ? shop.imageUrls[0] : '',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(width: double.infinity, height: double.infinity, color: Colors.white),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.grey.shade200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.store_outlined, size: 32, color: Colors.grey),
                                SizedBox(height: 4),
                                Text('No image', style: TextStyle(color: Colors.grey, fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Favorite button overlay
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 0.5,
                                color: Colors.black.withAlpha((255 * 0.1).toInt()),
                              ),
                            ],
                          ),
                          height: 35,
                          width: 35,
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                if (likeBloc.state.shopIds.contains(shop.id.toString())) {
                                  likeBloc.add(DeleteLike(shop.id));
                                  likeBloc.add(GetLikes());
                                } else {
                                  likeBloc.add(CreateLike(shop.id));
                                  likeBloc.add(GetLikes());
                                }
                              },
                              icon:
                                  BlocProvider.of<LikeBloc>(
                                    context,
                                    listen: true,
                                  ).state.shopIds.contains(shop.id.toString())
                                  ? Icon(Icons.favorite_outlined, size: 18, color: Colors.red)
                                  : Icon(Icons.favorite_outline, size: 18),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 120,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 6),
                    Text(
                      shop.name,
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),

                    shop.rating > 0
                        ? Row(
                            children:
                                List.generate(
                                  shop.rating.toInt(),
                                  (index) => Icon(Icons.star, color: Colors.yellow, size: 14),
                                )..addAll([
                                  SizedBox(width: 4),
                                  Text(
                                    shop.rating.toString(),
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ]),
                          )
                        : 12.h,

                    Row(
                      children: [
                        Icon(Icons.access_time, size: 14, color: Colors.grey),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            shop.workTime,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    OutlinedButton(
                      onPressed: () => launchUrl(
                        Uri.parse(
                          "https://www.google.com/maps/dir/?api=1&destination=${shop.latitude},${shop.longitude}&travelmode=walking&dir_action=navigate",
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.purple),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: Text("Do'konga borish", style: TextStyle(color: Colors.purple, fontSize: 12)),
                    ),
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
