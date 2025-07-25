import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:urgut_please/config/routes/routes.dart';
import 'package:urgut_please/features/explore/viewmodels/home/home_bloc.dart';
import 'package:urgut_please/features/explore/viewmodels/home/home_event.dart';
import 'package:urgut_please/features/explore/viewmodels/home/home_state.dart';
import 'package:urgut_please/features/explore/viewmodels/like/like_bloc.dart';
import 'package:urgut_please/features/explore/viewmodels/like/like_event.dart';
import 'package:urgut_please/shared/widgets/shop_item.dart';
import 'package:urgut_please/shared/widgets/shop_item_shimmer.dart';

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

  Future<void> _onRefresh() async {
    context.read<HomeBloc>().add(FetchShopsRequested());
    // Add a small delay to ensure the refresh indicator shows
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return DefaultTabController(
          length: state.status == HomeStatus.loading ? 4 : state.categories.length,
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
                            ),
                          ),
                          SizedBox(height: 24),

                          // Featured Carousel - Fixed to handle loading and empty states
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 200,
                              autoPlay: state.status != HomeStatus.loading && state.featuredShops.isNotEmpty,
                              enlargeCenterPage: false,
                              enableInfiniteScroll:
                                  state.status != HomeStatus.loading && state.featuredShops.length > 1,
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
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                        ),
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
                                                      Icon(Icons.error_outline, size: 40, color: Colors.grey),
                                                      SizedBox(height: 8),
                                                      Text(
                                                        'Image not available',
                                                        style: TextStyle(color: Colors.grey, fontSize: 12),
                                                      ),
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
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.store_outlined, size: 48, color: Colors.grey),
                                            SizedBox(height: 8),
                                            Text(
                                              'No featured shops available',
                                              style: TextStyle(color: Colors.grey, fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
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
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          child: TabBar(
                            isScrollable: true,
                            tabs: state.status == HomeStatus.loading
                                ? List.generate(4, (index) => Tab(child: Text('Loading...')))
                                : state.categories.map((category) => Tab(child: Text(category.name))).toList(),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: List.generate(
                    state.status == HomeStatus.loading ? 4 : state.categories.length,
                    (i) => RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                            sliver: SliverGrid(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: .57,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (context, j) {
                                  if (state.status == HomeStatus.loading) {
                                    return const ShopItemShimmer();
                                  }

                                  final shops = state.categoryShops[i + 1];
                                  if (shops == null || j >= shops.length) {
                                    return SizedBox.shrink();
                                  }

                                  final shop = shops[j];
                                  return ShopItem(shop: shop);
                                },
                                childCount: state.status == HomeStatus.loading
                                    ? 6
                                    : state.categoryShops[i + 1]?.length ?? 0,
                              ),
                            ),
                          ),
                          // Add extra space at bottom for better scroll experience
                          SliverToBoxAdapter(child: SizedBox(height: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
