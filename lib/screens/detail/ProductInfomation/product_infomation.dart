// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/styles.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/product.dart';

class ProductInfomation extends StatelessWidget {
  DataProduct product;
  ProductInfomation({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Information', style: AppStyle.sectionTitle),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Brand', style: TextStyle(color: AppColors.greyDarker)),
                Text('${product.brandName}', style: const TextStyle(color: AppColors.greyDarker))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Category',
                    style: TextStyle(color: AppColors.greyDarker)),
                Text('${product.categoryName}', style: const TextStyle(color: AppColors.greyDarker))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sub Category',
                    style: TextStyle(color: AppColors.greyDarker)),
                GestureDetector(
                  onTap: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCategoryPage(categoryId: 3, categoryName: 'Electronic')));
                  },
                  child: Text('${product.subCategoryName}',
                      style: const TextStyle(color: AppColors.greyDarker)),
                )
              ],
            ),
          ],
        ));
  }
}
