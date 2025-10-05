import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shops/features/explore/viewmodels/like/like_bloc.dart';
import 'package:shops/features/explore/viewmodels/like/like_state.dart';
import 'package:shops/shared/widgets/shop_item.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = BlocProvider.of<LikeBloc>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: Text("Yoqtirilganlar", style: TextStyle()), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: viewmodel.state.status != LikeStatus.success ? MediaQuery.of(context).size.height - 250 : null,
            child: BlocBuilder<LikeBloc, LikeState>(
              builder: (context, state) {
                if (state.status == LikeStatus.initial) {
                  return Center(child: Text("Yoqtirilgan do'konlarni yuklang"));
                } else if (state.status == LikeStatus.empty) {
                  return Center(child: Text("Yoqtirilgan do'konlar mavjud emas"));
                } else if (state.status == LikeStatus.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.status == LikeStatus.success) {
                  final itemWidth = (MediaQuery.of(context).size.width - 32) / 2;
                  final itemHeight = itemWidth + 120;
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
                          childAspectRatio: itemWidth / itemHeight,
                        ),
                        children: List.generate(state.likedShops.length, (index) {
                          final shop = state.likedShops[index];

                          return ShopItem(shop: shop);
                        }),
                      ),
                    ),
                  );
                } else {
                  return Center(child: Text("Yoqtirilgan do'konlarni yuklab bo'lmadi"));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
