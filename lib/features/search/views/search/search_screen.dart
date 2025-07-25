import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_please/features/search/viewmodels/search/search_bloc.dart';
import 'package:urgut_please/features/search/viewmodels/search/search_state.dart';
import 'package:urgut_please/shared/widgets/shop_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = BlocProvider.of<SearchBloc>(context, listen: true);

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
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha((255 * 0.4).toInt()),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 7,
                            child: TextField(
                              textInputAction: TextInputAction.search,
                              controller: viewmodel.searchController,
                              onSubmitted: (_) => viewmodel.search(),
                              onChanged: (value) {
                                if ((viewmodel.state.emptyQuery && value != '') ||
                                    (!viewmodel.state.emptyQuery && value == '')) {
                                  viewmodel.refresh();
                                }
                              },
                              decoration: InputDecoration(
                                hint: Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Text("Qidirish", style: TextStyle(color: Colors.black38)),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          if (!viewmodel.state.emptyQuery)
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                icon: Icon(Icons.close, color: Colors.black38, size: 24),
                                onPressed: () => viewmodel.searchController.text = '',
                              ),
                            ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: Icon(Icons.search, color: Colors.black38, size: 24),
                              onPressed: viewmodel.search,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Items
              SizedBox(
                height: viewmodel.state.status != SearchStatus.success
                    ? MediaQuery.of(context).size.height - 300
                    : null,
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state.status == SearchStatus.initial) {
                      return Center(child: Text("Do'konlarni qidiring"));
                    } else if (state.status == SearchStatus.empty) {
                      return Center(child: Text("Bunaqa do'kon mavjud emas"));
                    } else if (state.status == SearchStatus.loading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state.status == SearchStatus.success) {
                      return SizedBox(
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
                            children: List.generate(state.result!.length, (index) {
                              final shop = state.result![index];

                              return ShopItem(shop: shop);
                            }),
                          ),
                        ),
                      );
                    } else {
                      return Center(child: Text("Qidiruvni amalga oshirib bo'lmadi"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
