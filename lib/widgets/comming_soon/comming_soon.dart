// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/widgets/button/tika_button.dart';

class CommingSoon extends StatelessWidget {
  String title;
  String imageAssetUrl;
  bool? backButton;
  CommingSoon({Key? key, required this.title, required this.imageAssetUrl, this.backButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: widthP(context),
          height: heightP(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Image.asset(imageAssetUrl, width: widthP(context)/2),
              const SizedBox(height: 8),
              const Text(
                "This page is comming soon !",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                "Our team are currently working hard building this feature",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              backButton! == true ? TikaButton(
                label: "Back",
                onTap: ()=> Navigator.pop(context),
                width: widthP(context) / 2,
                height: 40,
              ) : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
