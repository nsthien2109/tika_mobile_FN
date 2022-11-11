import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/providers/home_provider.dart';

class RecommendedProduct extends StatelessWidget {
  const RecommendedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (_, state, __) => Container(
              child: RefreshIndicator(
                  onRefresh: state.refreshData, child: Container()),
            ));
  }
}
