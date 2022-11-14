// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/models/product.dart';
import 'package:tika_store/widgets/product_grid_card/product_grid_card.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class RecommendedProduct extends StatelessWidget {
  List<DataProduct>? products;
  RecommendedProduct({Key? key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageSize = (widthP(context) - 24) / 2 - 12;
    return products != null 
        ? GridView.count(
            padding: const EdgeInsets.all(10),
            primary: false,
            childAspectRatio: 5 / 8,
            shrinkWrap: true,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
            children: List.generate(products!.length, (index) => ProductGridCard(
                product: products![index],
              )
            ),
        )
        : ShimmerLoading().buildShimmerProduct(imageSize);
    }
}