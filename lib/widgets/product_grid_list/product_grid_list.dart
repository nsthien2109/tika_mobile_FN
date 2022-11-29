// ignore_for_file: must_be_immutable, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/models/product.dart';
import 'package:tika_store/widgets/empty_result/empty_result.dart';
import 'package:tika_store/widgets/product_grid_card/product_grid_card.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class ProductGridList extends StatelessWidget {
  List<DataProduct>? products;
  bool? isLoading;
  ProductGridList({Key? key,required this.products, this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageSize = (widthP(context) - 24) / 2 - 12;
    if(isLoading == true){
      return ShimmerLoading().buildShimmerProduct(imageSize);
    }
    if(products != null){
      if(products?.length == 0){
        return EmptyResult(title: "No products found");
      }
      return GridView.count(
          padding: const EdgeInsets.all(10),
          primary: false,
          childAspectRatio: 5 / 8,
          shrinkWrap: true,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          children: List.generate(
            products?.length ?? 0, 
            (index) => ProductGridCard(
              product: products![index],
            )
          ),
      );
    }else{
      return ShimmerLoading().buildShimmerProduct(imageSize);
    }
  }
}