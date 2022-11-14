// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/image.dart';
import 'package:tika_store/widgets/cache_image/cache_image_network.dart';

class ProductImageSlider extends StatelessWidget {
  List<DataImage>? images;
  Function(int index) onChangeSlider;
  int currentSlider;
  ProductImageSlider({Key? key, required this.onChangeSlider, required this.currentSlider,required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        images != null ? CarouselSlider(
          items: [
            ...?images?.map((item) => Container(
                  child: cacheImageNetwork(width: 0, height: 0, url: '$server/${item.url}'),
                )
              )
          ], 
          options: CarouselOptions(
              aspectRatio: 1,
              viewportFraction: 1.0,
              autoPlay: false,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) => onChangeSlider(index)
          ),
        ) : const Text("Fix lỗi nhanh "),
        Positioned(
          bottom: 16,
          left: 16,
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4)
            ),
            child: Text('${currentSlider+1}/${images?.length}', style: const TextStyle(
                color: Colors.white, fontSize: 11
            )),
          ),
        ),
      ],
    );
  }
}
