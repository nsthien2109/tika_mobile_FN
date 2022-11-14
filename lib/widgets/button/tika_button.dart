// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';

class TikaButton extends StatelessWidget {
  String label;
  double? width;
  double? height;
  Function? onTap;
  TikaButton({Key? key, required this.label ,this.width, this.height, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.primary
      ),
      width: width ?? widthP(context),
      height: height ?? 60,
      child: TextButton(
        onPressed: (){
          onTap == null ?  null : onTap!();
        },
        child: Text(label,
        style: const TextStyle(
          color: AppColors.white
        ),
        ),
      ),
    );
  }
}
