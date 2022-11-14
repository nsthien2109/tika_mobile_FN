import 'package:flutter/material.dart';
import 'package:tika_store/screens/order/OrderListCard/order_list_card.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order List"),
        centerTitle: false,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 5,
          // Add one more item for progress indicator
          padding: const EdgeInsets.symmetric(vertical: 0),
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return const OrderListCard();
          },
        ),
      ),
    );
  }
}