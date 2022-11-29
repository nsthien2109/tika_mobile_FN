// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/styles.dart';
import 'package:tika_store/models/order_detail.dart';
import 'package:tika_store/widgets/cache_image/cache_image_network.dart';

class OrderDetailItemCard extends StatelessWidget {
  DataOrderDetail orderDetail;
  OrderDetailItemCard({Key? key, required this.orderDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final double imageSize = widthP(context)/6;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              margin: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(8)),
                      child: cacheImageNetwork(width: imageSize, height: imageSize, url: '$server/${orderDetail.productImage}')),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${orderDetail.productName}',
                          style:
                          AppStyle.productName.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: Text('${orderDetail.quantity} item', style: AppStyle.productPrice.copyWith(color: Colors.grey[400]))
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 0,
            color: Colors.grey[400],
          ),
          Container(
              margin: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Price', style: TextStyle(
                      fontSize: 12
                  )),
                  Text('\$ ${orderDetail.total}', style: AppStyle.productPrice)
                ],
              )
          )
        ],
      ),
    );
  }
}