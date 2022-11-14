// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/product.dart';
import 'package:tika_store/widgets/cache_image/cache_image_network.dart';

class ProductGridCard extends StatelessWidget {
  DataProduct product;
  ProductGridCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageSize = (widthP(context) - 24) / 2 - 12;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      color: AppColors.white,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/detail', arguments: product),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
              child: cacheImageNetwork(
                width: imageSize,
                height: imageSize,
                url: '$server/${product.productImage}')
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${product.productName}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.blackLighter
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ ${product.productPrice}', style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                        )),
                        Text('${product.purchases} Sale', style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.greyLighter
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
