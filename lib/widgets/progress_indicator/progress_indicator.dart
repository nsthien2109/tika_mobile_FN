// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/theme.dart';

class CustomerProgressIndicator extends StatelessWidget {
  bool loadData;
  CustomerProgressIndicator({super.key, required this.loadData});

  @override
  Widget build(BuildContext context) {
    return loadData == false ? Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: 1,
          child: Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.all(5),
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              strokeWidth: 2.0,
            ),
          ),
        ),
      ),
    ) : const SizedBox.shrink();
  }
}

