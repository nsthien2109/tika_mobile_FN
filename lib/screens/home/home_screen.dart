import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/auth_provider.dart';
import 'package:tika_store/providers/home_provider.dart';
import 'package:tika_store/screens/home/category/category_menu.dart';
import 'package:tika_store/screens/home/recommended/recommended_product.dart';
import 'package:tika_store/screens/home/slideshow/slideshow.dart';
import 'package:tika_store/widgets/search_bar/search_bar.dart';
import 'package:tika_store/widgets/section_title/section_title.dart';
import 'package:tika_store/widgets/progress_indicator/progress_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer2<HomeProvider,AuthProvider>(
          builder: (_,state,state2,__) {
            return RefreshIndicator(
              color: AppColors.primary,
              strokeWidth: 1,
              onRefresh: state.refreshData,
              child: CustomScrollView(
                primary: false,
                shrinkWrap: true,
                controller: state.scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tika".toUpperCase(),
                          style: const TextStyle(
                              fontFamily: 'TitanOne', color: AppColors.primary),
                        ),
                        GestureDetector(
                            onTap: ()=> Navigator.pushNamed(context, '/cart'),
                            child: Stack(
                              children: [
                                const Icon(FluentIcons.cart_16_regular, size: 30,),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.red, 
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Text("${state2.cartList.data?.length}", style: const TextStyle(
                                      fontSize: 7, 
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white
                                    ),),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                    floating: true,
                    backgroundColor: AppColors.white,
                    expandedHeight: 60,
                  ),
                  const SearchBar(),
                  SliverList(
                      delegate: SliverChildListDelegate(
                      [
                        SlideShow(
                          banners: state.banners.data,
                          currentSlider: state.currentSlider,
                          onChangeSlider: (value) => state.onChangeSlider(value),
                        ),
                        CategoryMenu(categories: state.categories.data),
                        SectionTitle(sectionTitle: "Flash Sale"),
                        SectionTitle(sectionTitle: "Recommended Products"),
                        RecommendedProduct(products: state.products.data?.data),     
                      ]
                    )
                  ),
                  SliverToBoxAdapter(
                    child: CustomerProgressIndicator(loadData: state.loadingProduct),
                  )            
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
