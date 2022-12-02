// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/styles.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/order.dart';
import 'package:tika_store/providers/auth_provider.dart';
import 'package:tika_store/providers/order_provider.dart';
import 'package:tika_store/screens/order_detail/OrderDetailItemCard/order_detail_item_card.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class OrderDetailScreen extends StatefulWidget {
  DataOrder dataOrder;
  OrderDetailScreen({super.key, required this.dataOrder});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  void initState() {
    context.read<OrderProvider>().getDetailOrder(widget.dataOrder.idOrder);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Order Detail'),
      ),
      body: Consumer<OrderProvider>(
        builder: (_,state,__) {
          return state.orderLoading != true ? ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                child: Column(
                  children: [
                    ...state.orderDetail.data!.map(
                      (orderItem) => OrderDetailItemCard(orderDetail: orderItem)
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Delivery Details', style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold
                    )),
                    const SizedBox(
                      height: 16,
                    ),
                    Table(
                      children: [
                        TableRow(children: [
                          const Text('Coupon Code', style: TextStyle(
                            color: AppColors.greyDarker, fontSize: 13,
                          )),
                          Text('${widget.dataOrder.orderCoupon}', style: const TextStyle(
                              color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold
                          ))
                        ]),
                        TableRow(children: [
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: const Text('Notes', style: TextStyle(
                              color: AppColors.greyDarker, fontSize: 13,
                            )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(widget.dataOrder.orderNotes ?? '', style: const TextStyle(
                                color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold
                            )),
                          )
                        ]),
                        TableRow( children: [
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: const Text('Delivery Address', style: TextStyle(
                              color: AppColors.greyDarker, fontSize: 13,
                            )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text('${widget.dataOrder.orderName}', style: const TextStyle(
                                    color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold
                                )),
                                Text('${widget.dataOrder.orderPhone}', style: const TextStyle(
                                    color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold
                                )),
                                Text('${widget.dataOrder.addressSpecific}', style: const TextStyle(
                                    color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold
                                )),
                                Text('${widget.dataOrder.addressDistrict}', style: const TextStyle(
                                    color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold
                                )),
                                Text('${widget.dataOrder.addressProvince}', style: const TextStyle(
                                    color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold
                                )),
                              ],
                            ),
                          )
                        ]),
                      ],
                    ),
                  ],
                )
              ),

              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Payment Information', style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold
                    )),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Payment Method', style: TextStyle(
                            color: AppColors.greyDarker, fontSize: 13
                        )),
                        Text('${widget.dataOrder.paymentMethod}'.toUpperCase(), style: const TextStyle(
                            color: AppColors.black, fontSize: 13, fontWeight: FontWeight.bold
                        ))
                      ],
                    ),
                    Divider(
                      height: 32,
                      color: Colors.grey[400],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Fee ship', style: TextStyle(
                            color: AppColors.greyDarker, fontSize: 13
                        )),
                        Text('\$ ${widget.dataOrder.feeship}', style: AppStyle.productPrice)
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text('Total Price', style: TextStyle(
                            color: AppColors.greyDarker, fontSize: 13
                        )),
                        Text('\$ ${widget.dataOrder.orderTotal}', style: AppStyle.productPrice)
                      ],
                    ),
                    Divider(
                      height: 32,
                      color: Colors.grey[400],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text('Total Payment', style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold
                        )),
                        Text('\$ ${widget.dataOrder.orderTotal}', style: AppStyle.productPrice)
                      ],
                    ),
                  ],
                )
              )
            ],
          ) : ShimmerLoading().buildShimmerContent();
        }
      ),
    );
  }
}
