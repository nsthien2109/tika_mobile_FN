// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/theme.dart';

class ProgressIndicator extends StatelessWidget {
  bool lastData;
  ProgressIndicator({super.key, required this.lastData});

  @override
  Widget build(BuildContext context) {
    return !lastData ? Padding(
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

