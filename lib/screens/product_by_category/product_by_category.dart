// ignore_for_file: must_be_immutable

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/models/category.dart';
import 'package:tika_store/providers/category_provider.dart';
import 'package:tika_store/widgets/cache_image/cache_image_network.dart';
import 'package:tika_store/widgets/product_grid_card/product_grid_card.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class ProductByCategory extends StatefulWidget {
  DataCategory category;
  ProductByCategory({super.key, required this.category});

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {
  @override
  void initState() {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.getProductOfCategory(widget.category.idCategory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imageSize = (widthP(context) - 24) / 2 - 12;
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.category.categoryName}"),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(FluentIcons.search_12_regular),
          )
        ],
      ),
      body: SafeArea(
        child: Consumer<CategoryProvider>(
            builder: (_, state, __) => CustomScrollView(
                  shrinkWrap: true,
                  primary: false,
                  controller: state.scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(                      
                        [
                          SizedBox(
                            width: widthP(context),
                            height: 180,
                            child: cacheImageNetwork(
                                url: '$server/${widget.category.categoryImage}'),
                          ),
                          state.products.data?.data != null ? GridView.count(
                            padding: const EdgeInsets.all(10),
                            primary: false,
                            childAspectRatio: 5 / 8,
                            shrinkWrap: true,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            crossAxisCount: 2,
                            children: List.generate(
                                state.products.data?.data?.length ?? 0,
                                (index) => ProductGridCard(
                                    product: state.products.data!.data![index])),
                          ) : ShimmerLoading().buildShimmerProduct(imageSize)
                        ]
                      )
                    ),
                  ],
                )),
      ),
    );
  }
}
