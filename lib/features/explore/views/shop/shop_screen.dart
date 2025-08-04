import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:urgut_place/core/utils/extensions.dart';
import 'package:urgut_place/shared/models/shop/shop_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopScreen extends StatelessWidget {
  final ShopModel shop;

  const ShopScreen({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Carousel with images
                  Positioned.fill(
                    child: CarouselSlider(
                      items: shop.imageUrls.isNotEmpty
                          ? shop.imageUrls.map((imageUrl) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: Colors.grey.shade200,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.store_outlined, size: 80, color: Colors.grey),
                                        SizedBox(height: 16),
                                        Text('Image not available', style: TextStyle(color: Colors.grey, fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList()
                          : [
                              // Fallback when no images
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: double.infinity,
                                color: Colors.grey.shade200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.store_outlined, size: 80, color: Colors.grey),
                                    SizedBox(height: 16),
                                    Text('No images available', style: TextStyle(color: Colors.grey, fontSize: 16)),
                                  ],
                                ),
                              ),
                            ],
                      options: CarouselOptions(
                        height: double.infinity,
                        autoPlay: false,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: shop.imageUrls.length > 1,
                      ),
                    ),
                  ),
                  // Single back button positioned over the carousel
                  Positioned(
                    top: 50,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha((255 * 0.5).toInt()),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.chevron_left, color: Colors.white, size: 28),
                      ),
                    ),
                  ),
                  // Image counter
                  if (shop.imageUrls.length > 1)
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha((255 * 0.6).toInt()),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${shop.imageUrls.length} ta rasm',
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shop.name,
                    style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  if (shop.rating > 0) ...[
                    Row(
                      children:
                          List.generate(
                            shop.rating.toInt(),
                            (index) => Icon(Icons.star, color: Colors.yellow, size: 20),
                          )..addAll([
                            SizedBox(width: 4),
                            Text(shop.rating.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            SizedBox(width: 12),
                            Text(
                              "(${shop.ratingCount} ta baho)",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
                            ),
                          ]),
                    ),
                    SizedBox(height: 4),
                  ],
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 20, color: Colors.purple),
                      SizedBox(width: 4),
                      Text(shop.workTime, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Description
                  Text(
                    "Tavsif",
                    style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    shop.description,
                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 16),

                  // Seller section
                  Container(
                    height: 70,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(image: AssetImage("assets/icons/user.png"), fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sotuvchi",
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  shop.sellerPhone.formatPhone(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => launchUrl(Uri.parse("tel:${shop.sellerPhone}")),
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(100)),
                            child: Icon(Icons.call, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Landmark
                  if (shop.landmark.isNotEmpty) ...[
                    Text(
                      "Manzil",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Text(shop.landmark, style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
                    SizedBox(height: 16),
                  ],

                  // Navigation button
                  GestureDetector(
                    onTap: () => launchUrl(
                      Uri.parse(
                        "https://www.google.com/maps/dir/?api=1&destination=${shop.latitude},${shop.longitude}&travelmode=walking&dir_action=navigate",
                      ),
                    ),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.purple),
                      child: Center(
                        child: Text(
                          "Do'konga borish",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
