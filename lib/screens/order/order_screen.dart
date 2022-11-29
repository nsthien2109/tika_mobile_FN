import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/providers/auth_provider.dart';
import 'package:tika_store/screens/order/OrderListCard/order_list_card.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_,state,__) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Order List"),
            centerTitle: false,
          ),
          body: SafeArea(
            child: state.orderLoading != true ? ListView.builder(
              itemCount: state.orderList.data?.length,
              // Add one more item for progress indicator
              padding: const EdgeInsets.symmetric(vertical: 0),
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return OrderListCard(order: state.orderList.data![index]);
              },
            ) : ShimmerLoading().buildShimmerContent()
          ),
        );
      }
    );
  }
}