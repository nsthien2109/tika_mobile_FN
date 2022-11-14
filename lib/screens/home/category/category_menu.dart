// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/category.dart';
import 'package:tika_store/widgets/cache_image/cache_image_network.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class CategoryMenu extends StatelessWidget {
  List<DataCategory>? categories;
  CategoryMenu({super.key, this.categories});

  @override
  Widget build(BuildContext context) {
    return categories != null
        ? Container(
            padding: const EdgeInsets.all(10),
            height: 180,
            width: widthP(context),
            child: GridView.count(
              physics: const BouncingScrollPhysics(),
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              shrinkWrap: true,
              crossAxisCount: 2,
              scrollDirection: Axis.horizontal,
              childAspectRatio: .9,
              children: List.generate(
                  categories!.length,
                  (index) => GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/category', arguments: categories![index]),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              color: AppColors.black,
                              child: Opacity(
                                  opacity: .7,
                                  child: cacheImageNetwork(
                                    height: 0,
                                    width: widthP(context),
                                    url:
                                        '$server/${categories?[index].categoryImage}',
                                  )),
                            ),
                            Text(
                              "${categories?[index].categoryName}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                            )
                          ],
                        ),
                      )),
            ),
          )
        : ShimmerLoading().buildShimmerCategory();
  }
}
