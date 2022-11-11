import 'package:flutter/material.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class RecommendedProduct extends StatelessWidget {
  const RecommendedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _shimmerLoading = ShimmerLoading();
    return Container(
      child: _shimmerLoading.buildShimmerProduct(((MediaQuery.of(context).size.width) - 24) / 2 - 12),
    );
  }
}