// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/order.dart';

class OrderListCard extends StatelessWidget {
  DataOrder order;
  OrderListCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/order_detail', arguments: order),
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Card(
          elevation: 1,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                child: Text("Order#${order.idOrder}", style: const TextStyle(
                      color: AppColors.primary, fontSize: 12
                  )
                ),
              ),
              const Divider(
                height: 0,
                color: AppColors.greyLighter,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                child: Text("${order.orderPhone}", style: const TextStyle(
                    fontSize:14, fontWeight: FontWeight.w500
                  )
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                     ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/checkout.png',width: 30)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                       "${order.addressProvince} ${order.addressDistrict} ${order.addressCommune} ${order.addressSpecific}" ,
                       maxLines: 3,
                       overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                     "Total",
                     style: TextStyle(
                      fontWeight: FontWeight.w500
                     ),
                    ),
                    Text(
                     "\$ ${order.orderTotal}",
                     style: const TextStyle(
                      color: AppColors.red
                     ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}