import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tika_store/configs/theme.dart';

double _containerHeight = 20;
double _spaceHeight = 10;

class ShimmerLoading {
  Widget buildShimmerContent() {
    // list view use this
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 8,
        itemBuilder: (context, index) => Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Shimmer.fromColors(
                      baseColor: AppColors.shimmerColor,
                      highlightColor: AppColors.white,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.shimmerColor,
                            ),
                            height: 110,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                                color: AppColors.white,
                              ),
                              child: Container(
                                width: 80,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  padding: const EdgeInsets.only(left: 12.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: AppColors.shimmerColor,
                                  ),
                                  height: _containerHeight,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                    color: AppColors.white,
                                  )),
                                ),
                                SizedBox(
                                  height: _spaceHeight,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: AppColors.shimmerColor,
                                  ),
                                  height: _containerHeight,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                    color: AppColors.white,
                                  )),
                                ),
                                SizedBox(
                                  height: _spaceHeight,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: AppColors.shimmerColor,
                                  ),
                                  height: _containerHeight,
                                  width: 100,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                    color: AppColors.white,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ));
  }

  Widget buildShimmerProduct(boxImageSize) {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      primary: false,
      childAspectRatio: 5 / 8,
      shrinkWrap: true,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 2,
      children: List.generate(
          10,
          (index) => Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 1,
                  color: AppColors.white,
                  child: Shimmer.fromColors(
                    baseColor: AppColors.shimmerColor,
                    highlightColor: AppColors.white,
                    period: const Duration(milliseconds: 1000),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Container(
                            width: boxImageSize,
                            height: boxImageSize,
                            color: AppColors.shimmerColor,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.shimmerColor),
                                height: 12,
                              ),
                              SizedBox(height: _spaceHeight),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.shimmerColor,
                                ),
                                height: 12,
                              ),
                              SizedBox(height: _spaceHeight),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.shimmerColor,
                                ),
                                height: 12,
                                width: 70,
                              ),
                              SizedBox(height: _spaceHeight),
                              Row(
                                children: [
                                  for (int i = 1; i <= 5; i++)
                                    const Icon(FluentIcons.star_12_filled,
                                        color: AppColors.shimmerColor,
                                        size: 12),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
    );
  }

  Widget buildShimmerCategory() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 180,
      child: GridView.count(
        primary: false,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        shrinkWrap: true,
        crossAxisCount: 2,
        scrollDirection: Axis.horizontal,
        childAspectRatio: .9,
        children: List.generate(8, (index) {
          return Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: AppColors.shimmerColor,
            period: const Duration(milliseconds: 2000),
            child: Container(
              color: AppColors.shimmerColor,
            ),
          );
        }),
      ),
    );
  }

  Widget buildShimmerBanner(bannerWidth, bannerHeight) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: AppColors.shimmerColor,
      period: const Duration(milliseconds: 1000),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: bannerWidth,
        height: bannerHeight,
        color: AppColors.shimmerColor,
      ),
    );
  }
}
