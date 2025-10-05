import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shops/core/services/connectivity_service.dart';
import 'package:shops/features/explore/viewmodels/home/home_bloc.dart';
import 'package:shops/features/explore/viewmodels/home/home_event.dart';
import 'package:shops/features/explore/viewmodels/home/home_state.dart';
import 'package:shops/features/explore/views/home/widgets/home_featured_carousel.dart';
import 'package:shops/features/explore/views/home/widgets/home_search_bar.dart';
import 'package:shops/shared/widgets/shop_item.dart';
import 'package:shops/shared/widgets/shop_item_shimmer.dart';

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
    return StreamBuilder<List<ConnectivityResult>>(
      stream: ConnectivityService.connectivityStream,
      builder: (context, snapshot) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return DefaultTabController(
              length: state.status == HomeStatus.loading
                  ? 4
                  : state.categories.length + 1,
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
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: HomeSearchBar(),
                              ),
                              SizedBox(height: 24),
                              // Featured Carousel
                              HomeFeaturedCarousel(state: state),
                              SizedBox(height: 16),
                            ],
                          ),
                          bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(
                              kToolbarHeight,
                            ),
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
                                    ? List.generate(
                                        4,
                                        (index) =>
                                            Tab(child: Text('Yuklanmoqda...')),
                                      )
                                    : [
                                        Tab(child: Text('Barchasi')),
                                        ...state.categories.map(
                                          (category) =>
                                              Tab(child: Text(category.name)),
                                        ),
                                      ],
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                    body: TabBarView(
                      children: List.generate(
                        state.status == HomeStatus.loading
                            ? 4
                            : state.categories.length + 1,
                        (tabIndex) {
                          return _buildTabContent(context, state, tabIndex);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTabContent(BuildContext context, HomeState state, int tabIndex) {
    final itemWidth = (MediaQuery.of(context).size.width - 32) / 2;
    final itemHeight = itemWidth + 120;

    return RefreshIndicator(
      onRefresh: () async {
        if (tabIndex == 0) {
          // Barchasi tab
          context.read<HomeBloc>().add(RefreshAllRequested());
        } else if (tabIndex - 1 < state.categories.length) {
          final category = state.categories[tabIndex - 1];
          context.read<HomeBloc>().add(
            RefreshCategoryRequested(categoryId: category.id),
          );
        }
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels >=
              notification.metrics.maxScrollExtent - 200) {
            if (tabIndex == 0) {
              // Barchasi tab
              context.read<HomeBloc>().add(LoadMoreAllRequested());
            } else if (tabIndex - 1 < state.categories.length) {
              final category = state.categories[tabIndex - 1];
              context.read<HomeBloc>().add(
                LoadMoreCategoryRequested(categoryId: category.id),
              );
            }
          }
          return false;
        },
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 12),
              sliver: _buildShopsGrid(
                context,
                state,
                tabIndex,
                itemWidth,
                itemHeight,
              ),
            ),
            _buildLoadingIndicator(state, tabIndex),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }

  Widget _buildShopsGrid(
    BuildContext context,
    HomeState state,
    int tabIndex,
    double itemWidth,
    double itemHeight,
  ) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: itemWidth / itemHeight,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, itemIndex) {
          // Handle loading state
          if (state.status == HomeStatus.loading) {
            return const ShopItemShimmer();
          }

          List<dynamic>? shops;

          if (tabIndex == 0) {
            // Barchasi tab - use allShops
            shops = state.allShops;
          } else if (tabIndex - 1 < state.categories.length) {
            // Category tab
            final category = state.categories[tabIndex - 1];
            shops = state.categoryShops[category.id];
          }

          // Check if we have valid data
          if (shops == null || itemIndex >= shops.length) {
            if (tabIndex == 0 && state.allShops.isEmpty && !state.allLoading) {
              // Show empty state for Barchasi tab
              return itemIndex == 0 ? _buildEmptyState() : SizedBox.shrink();
            }
            return SizedBox.shrink();
          }

          final shop = shops[itemIndex];
          return ShopItem(shop: shop);
        },
        childCount: () {
          if (state.status == HomeStatus.loading) {
            return 6; // Show 6 shimmer items while loading
          }

          if (tabIndex == 0) {
            // Barchasi tab
            if (state.allShops.isEmpty && !state.allLoading) {
              return 1; // Show empty state
            }
            return state.allShops.length;
          } else if (tabIndex - 1 < state.categories.length) {
            // Category tab
            final category = state.categories[tabIndex - 1];
            return state.categoryShops[category.id]?.length ?? 0;
          }

          return 0;
        }(),
      ),
    );
  }

  Widget _buildLoadingIndicator(HomeState state, int tabIndex) {
    bool showLoading = false;

    if (tabIndex == 0) {
      showLoading = state.allLoading && state.allShops.isNotEmpty;
    } else if (tabIndex - 1 < state.categories.length) {
      final categoryId = state.categories[tabIndex - 1].id;
      showLoading =
          (state.categoryLoading[categoryId] == true) &&
          (state.categoryShops[categoryId]?.isNotEmpty == true);
    }

    if (showLoading) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return SliverToBoxAdapter(child: SizedBox.shrink());
  }

  Widget _buildEmptyState() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.store_outlined, size: 64, color: Colors.grey[400]),
          SizedBox(height: 16),
          Text(
            'Hech qanday do\'kon topilmadi',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Keyinroq qayta urinib ko\'ring',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
