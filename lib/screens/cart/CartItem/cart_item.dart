// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/styles.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/cart.dart';
import 'package:tika_store/widgets/cache_image/cache_image_network.dart';

class CartItem extends StatelessWidget {
  DataCart cartItem;
  Function() onAddQuantity;
  Function() onRemoveQuantity;
  CartItem({Key? key, required this.cartItem, required this.onAddQuantity,required this.onRemoveQuantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageSize = widthP(context) / 5;
    double totalProduct = cartItem.productPrice! * (cartItem.quantity as num);
    return Column(
      children: [
        Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 10),
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: cacheImageNetwork(
                          width: imageSize,
                          height: imageSize,
                          url: "$server/${cartItem.productImage}")),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "${cartItem.productName}",
                          style: AppStyle.productName.copyWith(fontSize: 14),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text('\$ $totalProduct',
                            style: AppStyle.productPrice),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        width: 1, color: Colors.grey[300]!)),
                                child: const Icon(Icons.delete,
                                    color: AppColors.greyDarker, size: 20),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: onRemoveQuantity,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Icon(Icons.remove,
                                        color: Colors.white, size: 20),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  child: Text("${cartItem.quantity}",
                                      style: const TextStyle()),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: onAddQuantity,
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    height: 28,
                                    decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Icon(Icons.add,
                                        color: Colors.white, size: 20),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
