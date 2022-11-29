// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tika_store/configs/responsive.dart';

class EmptyResult extends StatelessWidget {
  String title;
  EmptyResult({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthP(context),
      height: heightP(context) / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/images/empty_lottie.json'),
          Text(title)
        ],
      ),
    );
  }
}
