import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shops/core/utils/extensions.dart';
import 'package:shops/shared/models/shop/shop_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopScreen extends StatelessWidget {
  final ShopModel shop;

  const ShopScreen({super.key, required this.shop});

  IconData _getSocialIcon(String type) {
    switch (type.toLowerCase()) {
      case 'instagram':
        return Icons.camera_alt;
      case 'telegram':
        return Icons.send;
      case 'facebook':
        return Icons.facebook;
      default:
        return Icons.link;
    }
  }

  void _openImageViewer(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Colors.black.withOpacity(0.9),
            child: Center(
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 4,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                  errorWidget: (_, __, ___) => const Icon(Icons.image_not_supported, color: Colors.white, size: 64),
                  progressIndicatorBuilder: (_, __, progress) => CircularProgressIndicator(value: progress.progress),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

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
                              return GestureDetector(
                                onTap: () => _openImageViewer(context, imageUrl),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          shop.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (shop.logoUrl != null && shop.logoUrl!.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: shop.logoUrl!,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                              placeholder: (_, __) => Container(
                                width: 48,
                                height: 48,
                                color: Colors.grey.shade200,
                                child: Icon(Icons.store_outlined, color: Colors.grey.shade500, size: 24),
                              ),
                              errorWidget: (_, __, ___) => Container(
                                width: 48,
                                height: 48,
                                color: Colors.grey.shade200,
                                child: Icon(Icons.store_outlined, color: Colors.grey.shade500, size: 24),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 20, color: Colors.purple),
                      SizedBox(width: 6),
                      Text(
                        "Sektor ${shop.sector} • Do'kon ${shop.number}",
                        style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Sale type
                  Row(
                    children: [
                      Icon(Icons.shopping_cart, size: 20, color: Colors.purple),
                      SizedBox(width: 4),
                      Text(
                        shop.saleType == 'wholesale' 
                          ? 'Ulgurji' 
                          : shop.saleType == 'retail' 
                            ? 'Dona' 
                            : 'Ulgurji va Dona',
                        style: TextStyle(fontSize: 16),
                      ),
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

                  // Logo
                  SizedBox(height: 4),

                  // Seller phones section
                  if (shop.sellerPhones.isNotEmpty) ...[
                    Text(
                      "Telefon raqamlar",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    ...shop.sellerPhones.map((phone) => Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Container(
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 12),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.purple.withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(Icons.phone, color: Colors.purple, size: 20),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  phone.formatPhone(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => launchUrl(Uri.parse("tel:$phone")),
                              child: Container(
                                margin: EdgeInsets.only(right: 12),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(20)),
                                child: Icon(Icons.call, color: Colors.white, size: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    SizedBox(height: 16),
                  ],

                  // Social networks
                  if (shop.socialNetworks.isNotEmpty) ...[
                    Text(
                      "Ijtimoiy tarmoqlar",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: shop.socialNetworks.map((network) => GestureDetector(
                        onTap: () => launchUrl(Uri.parse(network.url)),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.purple, width: 1),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(_getSocialIcon(network.type), color: Colors.purple, size: 20),
                              SizedBox(width: 8),
                              Text(
                                network.type[0].toUpperCase() + network.type.substring(1).toLowerCase(),
                                style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      )).toList(),
                    ),
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
