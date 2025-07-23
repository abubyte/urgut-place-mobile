import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urgut_please/config/routes/routes.dart';
import 'package:urgut_please/features/explore/views/shop/widgets/shop_screen.dart';
import 'package:url_launcher/url_launcher.dart';

final imageUrls = <String>[
  "https://picsum.photos/seed/1/200/400",
  "https://picsum.photos/seed/2/200/400",
  "https://picsum.photos/seed/3/200/400",
  "https://picsum.photos/seed/4/200/400",
  "https://picsum.photos/seed/5/200/400",
  "https://picsum.photos/seed/6/200/400",
  "https://picsum.photos/seed/7/200/400",
  "https://picsum.photos/seed/8/200/400",
  "https://picsum.photos/seed/9/200/400",
  "https://picsum.photos/seed/10/200/400",
  "https://picsum.photos/seed/11/200/400",
  "https://picsum.photos/seed/12/200/400",
];

final names = <String>[
  "Yulduz Do'koni",
  "Nur Kiyim",
  "Yulduz Do'koni",
  "Nur Kiyim",
  "Yulduz Do'koni",
  "Nur Kiyim",
  "Yulduz Do'koni",
  "Nur Kiyim",
  "Yulduz Do'koni",
  "Nur Kiyim",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrollable) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  expandedHeight: 420,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  flexibleSpace: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: 16),
                      // Search Bar
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Container(
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
                            IconButton(
                              onPressed: () => context.go(Routes.items),
                              icon: Icon(Icons.favorite_outline, size: 24),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),

                      // Featured Carousel
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: true,
                          viewportFraction: .9,
                        ),
                        items: imageUrls.map((url) {
                          return Builder(
                            builder: (context) => GestureDetector(
                              onTap: () => context.go(Routes.shop),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 6),
                                height: 250,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 16),

                      // Discount Button
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        width: double.maxFinite,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "30%",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                      ),
                      child: TabBar(
                        isScrollable: true,
                        tabs: [
                          Tab(child: Text("Hammasi")),
                          Tab(child: Text("Oziq-ovqat")),
                          Tab(child: Text("Kiyim")),
                          Tab(child: Text("Texnika")),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: List.generate(
                4,
                (_) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12, right: 12, top: 12),
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
                                        image: DecorationImage(
                                          image: NetworkImage(imageUrls[index]),
                                          fit: BoxFit.cover,
                                        ),
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
                                          names[index],
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
