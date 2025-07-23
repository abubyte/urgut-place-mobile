import 'package:flutter/material.dart';
import 'package:urgut_please/features/explore/views/home/home_screen.dart';
import 'package:urgut_please/features/explore/views/shop/widgets/shop_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              // Search Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 32,
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
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Items
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: GridView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: .57,
                    ),
                    children: List.generate(
                      10,
                      (index) => GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ShopScreen())),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 6),
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  color: Colors.black.withAlpha((255 * .08).toInt()),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(image: NetworkImage(imageUrls[index]), fit: BoxFit.cover),
                                    ),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        height: 35,
                                        width: 35,
                                        margin: EdgeInsets.only(top: 10, right: 10),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.favorite_outline, size: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,

                                    children: [
                                      SizedBox(height: 6),
                                      Text(
                                        "Yulduz do'koni",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.yellow, size: 14),
                                          Icon(Icons.star, color: Colors.yellow, size: 14),
                                          Icon(Icons.star, color: Colors.yellow, size: 14),
                                          Icon(Icons.star, color: Colors.yellow, size: 14),
                                          Icon(Icons.star, color: Colors.yellow, size: 14),
                                          SizedBox(width: 4),
                                          Text("5", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.access_time, size: 14),
                                          SizedBox(width: 4),
                                          Text("08:00 - 21:00"),
                                        ],
                                      ),
                                      SizedBox(height: 8),

                                      OutlinedButton(
                                        onPressed: () => launchUrl(
                                          Uri.parse(
                                            "https://www.google.com/maps/dir/?api=1&destination=39.395661, 67.305775&travelmode=walking&dir_action=navigate",
                                          ),
                                        ),
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: Colors.purple),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        ),
                                        child: Text("Do'konga borish", style: TextStyle(color: Colors.purple)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
