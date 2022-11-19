// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';

class TikaButton extends StatelessWidget {
  String label;
  double? width;
  double? height;
  Function() onTap;
  bool? isLoading;
  TikaButton({Key? key, required this.label ,this.width, this.height,required this.onTap, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:  isLoading == false ? AppColors.primary : AppColors.primary.withOpacity(.8)
      ),
      width: width ?? widthP(context),
      height: height ?? 60,
      child: TextButton(
        onPressed: onTap,
        child: isLoading == false ? Text(label,
          style: const TextStyle(
            color: AppColors.white
          ),
        ) : const CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.white,
        ),
      ),
    );
  }
}
