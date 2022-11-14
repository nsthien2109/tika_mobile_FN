// ignore_for_file: must_be_immutable

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/models/category.dart';
import 'package:tika_store/providers/category_provider.dart';
import 'package:tika_store/widgets/cache_image/cache_image_network.dart';
import 'package:tika_store/widgets/product_grid_list/product_grid_list.dart';

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
                          ProductGridList(
                            products: state.products.data?.data,
                            isLoading: state.loadingProduct,
                          )
                        ]
                      )
                    ),
                  ],
                )),
      ),
    );
  }
}
