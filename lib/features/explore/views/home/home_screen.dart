import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_please/features/explore/viewmodels/home/home_bloc.dart';
import 'package:urgut_please/features/explore/viewmodels/home/home_event.dart';
import 'package:urgut_please/features/explore/viewmodels/home/home_state.dart';
import 'package:urgut_please/features/explore/views/home/widgets/home_featured_carousel.dart';
import 'package:urgut_please/features/explore/views/home/widgets/home_search_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return DefaultTabController(
          length: state.status == HomeStatus.loading ? 4 : state.categories.length + 1,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: NestedScrollView(
                headerSliverBuilder: (_, innerBoxIsScrollable) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      floating: true,
                      expandedHeight: 370,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      flexibleSpace: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(height: 16),

                          // Search Bar
                          Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: HomeSearchBar()),
                          SizedBox(height: 24),

                          // Featured Carousel - Fixed to handle loading and empty states
                          HomeFeaturedCarousel(state: state),
                          SizedBox(height: 16),
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
                                : [
                                    Tab(child: Text('All')),
                                    ...state.categories.map((category) => Tab(child: Text(category.name))),
                                  ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: List.generate(state.status == HomeStatus.loading ? 4 : state.categories.length + 1, (i) {
                    final itemWidth = (MediaQuery.of(context).size.width - 32) / 2;
                    final itemHeight = itemWidth + 120;
                    return RefreshIndicator(
                      onRefresh: () async => context.read<HomeBloc>().add(FetchShopsRequested()),
                      child: CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                            sliver: SliverGrid(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: itemWidth / itemHeight,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (context, j) {
                                  if (state.status == HomeStatus.loading) {
                                    return const ShopItemShimmer();
                                  }

                                  List<dynamic>? shops;

                                  if (i == 0) {
                                    shops =
                                        (state.categoryShops.values.expand((categoryShops) => categoryShops).toList())
                                          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
                                  } else {
                                    shops = state.categoryShops[i];
                                  }

                                  // final shops = state.categoryShops[i + 1];
                                  if (shops == null || j >= shops.length) {
                                    return SizedBox.shrink();
                                  }

                                  final shop = shops[j];
                                  return ShopItem(shop: shop);
                                },
                                childCount: state.status == HomeStatus.loading
                                    ? 6
                                    : () {
                                        if (i == 0) {
                                          // First tab - count all items
                                          return state.categoryShops.values
                                              .map((shops) => shops.length ?? 0)
                                              .fold(0, (sum, count) => sum + count);
                                        } else {
                                          // Other tabs - count items in specific category
                                          return state.categoryShops[i]?.length ?? 0;
                                        }
                                      }(),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(child: SizedBox(height: 20)),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
