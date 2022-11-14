// ignore_for_file: must_be_immutable

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tika_store/configs/styles.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/comment.dart';

class ProductRate extends StatelessWidget {
  List<DataComment>? comments;
  ProductRate({Key? key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Review', style: AppStyle.sectionTitle),
              GestureDetector(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ProductReviewPage()));
                },
                child: Text('View All',
                    style: AppStyle.viewAll.copyWith(color: AppColors.primary),
                    textAlign: TextAlign.end),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(children: [
            ...List.generate(
                5,
                (index) => const Icon(FluentIcons.star_12_filled,
                    size: 15, color: AppColors.yellow)),
            const SizedBox(width: 5),
            Text("(${comments?.length ?? 0})",
                style: const TextStyle(
                    fontSize: 15, color: AppColors.blackLighter))
          ]),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColors.shimmerColor
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${comments?[index].lastName}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15
                          ),
                        ),
                        _buildStarBar(comments?[index].starRate),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text("${comments?[index].commentContent}", 
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.blackLighter
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: comments?.length ?? 0,
          )
        ],
      ),
    );
  }

  Widget _buildStarBar(star) {
    return Row(
      children: [
        for (int i = 0; i < star ;  i++) const Icon(FluentIcons.star_12_filled, size: 12, color: AppColors.yellow),
        for (int j = 0; j < 5 - star ;  j++) const Icon(FluentIcons.star_12_filled, size: 12,color: AppColors.greyLighter)
      ],
    );
  }
}
