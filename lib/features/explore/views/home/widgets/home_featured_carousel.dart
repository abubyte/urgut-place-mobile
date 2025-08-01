import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:urgut_please/config/routes/routes.dart';
import 'package:urgut_please/features/explore/viewmodels/home/home_state.dart';

class HomeFeaturedCarousel extends StatelessWidget {
  final HomeState state;

  const HomeFeaturedCarousel({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: state.status != HomeStatus.loading && state.featuredShops.isNotEmpty,
        enlargeCenterPage: false,
        enableInfiniteScroll: state.status != HomeStatus.loading && state.featuredShops.length > 1,
        viewportFraction: .9,
      ),
      items: state.status == HomeStatus.loading
          ? List.generate(3, (index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                ),
              );
            })
          : state.featuredShops.isNotEmpty
          ? state.featuredShops
                .where((shop) => shop.imageUrls.isNotEmpty)
                .map(
                  (shop) => GestureDetector(
                    onTap: () => context.go(Routes.shop, extra: shop),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: CachedNetworkImage(
                          imageUrl: shop.imageUrls[0],
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
                                Icon(Icons.error_outline, size: 40, color: Colors.grey),
                                SizedBox(height: 8),
                                Text('Image not available', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList()
          : [
              // Fallback when no featured shops available
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.store_outlined, size: 48, color: Colors.grey),
                      SizedBox(height: 8),
                      Text('No featured shops available', style: TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
    );
  }
}
