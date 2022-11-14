import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tika_store/configs/responsive.dart';

class EmptyResult extends StatelessWidget {
  const EmptyResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthP(context),
      height: heightP(context) - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/images/empty_lottie.json'),
          const Text("No results found")
        ],
      ),
    );
  }
}
