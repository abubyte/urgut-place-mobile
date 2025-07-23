import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 350,
            flexibleSpace: CarouselSlider(
              items: [
                Container(
                  // width: double.maxFinite,
                  // height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/seed/12/450/450"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 16, top: 50),
                      child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.chevron_left)),
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/seed/13/450/450"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/seed/14/450/450"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/seed/15/450/450"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(autoPlay: false, viewportFraction: 1, aspectRatio: 1),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 6),
                  Text(
                    "Yulduz do'koni",
                    style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      SizedBox(width: 4),
                      Text("5", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      SizedBox(width: 12),
                      Text(
                        "(857 ta sharh)",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 20, color: Colors.purple),
                      SizedBox(width: 4),
                      Text("08:00 - 21:00", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Desc
                  Text(
                    "Tavsif",
                    style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen  versions of Lorem Ipsum.",
                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 16),

                  Text(
                    "Sotuvchi",
                    style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),

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
                                // border: Border.all(color: Colors.grey),
                                image: DecorationImage(
                                  image: NetworkImage("https://picsum.photos/60/60"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Aziz",
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow, size: 20),
                                    Icon(Icons.star, color: Colors.yellow, size: 20),
                                    Icon(Icons.star, color: Colors.yellow, size: 20),
                                    Icon(Icons.star, color: Colors.yellow, size: 20),
                                    Icon(Icons.star, color: Colors.yellow, size: 20),
                                    SizedBox(width: 4),
                                    Text("5", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => launchUrl(Uri.parse("tel:+998000000000")),
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(100),
                              // border: Border.all(color: Colors.grey),
                              // image: DecorationImage(
                              //   image: NetworkImage("https://picsum.photos/seed/20/60/60"),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                            child: Icon(Icons.call, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  Text("Urgut, Markaziy ko'cha 12", style: TextStyle(fontSize: 14)),
                  SizedBox(height: 16),

                  GestureDetector(
                    onTap: () => launchUrl(
                      Uri.parse(
                        "https://www.google.com/maps/dir/?api=1&destination=39.395661, 67.305775&travelmode=walking&dir_action=navigate",
                      ),
                    ),
                    // style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.purple)),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.purple),
                      child: Center(
                        child: Text(
                          "Do'konga borish",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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
