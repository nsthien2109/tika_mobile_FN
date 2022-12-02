import 'package:flutter/material.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/widgets/button/tika_button.dart';

class OrderWithoutLoginScreen extends StatelessWidget {
  const OrderWithoutLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/order_stk.png', width: widthP(context)/2),
              const SizedBox(height: 16),
              TikaButton(
                width: widthP(context) / 1.5,
                height: 50,
                label: "Login to continue",
                onTap: ()=> Navigator.pushNamed(context, '/sign_in')
              )
            ],
          ),
        ),
      ),
    );
  }
}