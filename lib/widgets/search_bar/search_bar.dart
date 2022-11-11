import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';
import 'dart:math' as math;

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 70.0,
        maxHeight: 70.0,
        child: Container(
          color: AppColors.white,
          child: Container(
            color: AppColors.white,
            width: widthP(context),
            padding: const EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    enabled: false,
                    fillColor: AppColors.white,
                    hintText: "Search products...",
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.red, width: .5),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.red, width: .5),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.red, width: .5),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Positioned(
                  right: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.primary,
                    ),
                    height: 45,
                    width: 45,
                    child: const Icon(
                      FluentIcons.search_16_regular,
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
