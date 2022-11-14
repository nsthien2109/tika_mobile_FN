// ignore_for_file: must_be_immutable

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tika_store/configs/styles.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/product.dart';

class ProductSumary extends StatelessWidget {
  DataProduct product;
  ProductSumary({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${product.productPrice}",
                style: AppStyle.detailProductPrice,
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(FluentIcons.heart_16_regular),
              )
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '${product.productName}',
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          IntrinsicHeight(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.star, color: AppColors.yellow, size: 18),
                      SizedBox(
                        width: 3,
                      ),
                      Text('5.0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(
                        width: 3,
                      ),
                      Text('(25)',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.blackLighter)),
                    ],
                  ),
                ),
                VerticalDivider(
                  width: 30,
                  thickness: 1,
                  color: Colors.grey[300],
                ),
                Text('${product.purchases} Sale',
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.blackLighter)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
