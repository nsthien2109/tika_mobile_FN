// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/styles.dart';
import 'package:tika_store/providers/category_provider.dart';
import 'package:tika_store/widgets/product_grid_card/product_grid_card.dart';

class ProductRelated extends StatelessWidget {
  int idProduct;
  ProductRelated({Key? key, required this.idProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageSize = (MediaQuery.of(context).size.width / 2);
    return Consumer<CategoryProvider>(
      builder: (_,state,__) {
        var products = state.products.data?.data;
        products = products?.where((product) => product.idProduct != idProduct).toList();
        return Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.only(bottom:16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text('Related Product', style: AppStyle.sectionTitle),
                ),
                SizedBox(
                  height: imageSize*1.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: products?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: imageSize+10,
                        child: ProductGridCard(product: products![index])
                      );
                    },
                  ),
                ),
              ],
            )
        );
      }
    );
  }
}