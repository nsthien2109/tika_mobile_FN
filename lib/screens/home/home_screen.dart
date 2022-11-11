import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/banner_provider.dart';
import 'package:tika_store/screens/home/brand/brand_menu.dart';
import 'package:tika_store/screens/home/category/category_menu.dart';
import 'package:tika_store/screens/home/recommended/recommended_product.dart';
import 'package:tika_store/screens/home/slideshow/slideshow.dart';
import 'package:tika_store/widgets/search_bar/search_bar.dart';
import 'package:tika_store/widgets/section_title/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(FluentIcons.cart_16_regular))
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
                  const SlideShow(),
                  const CategoryMenu(),
                  SectionTitle(sectionTitle: "Flash Sale"),
                  SectionTitle(sectionTitle: "Brands"),
                  SectionTitle(sectionTitle: "Recommended Products"),
                  RecommendedProduct()
                ]
              )
            ),            
          ],
        ),
      ),
    );
  }
}
