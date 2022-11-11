// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:tika_store/configs/theme.dart';

CachedNetworkImage cacheImageNetwork({double? width, double? height, url, plColor, imageColor}) {
  if (width == 0 && height == 0) {
    return CachedNetworkImage(
      placeholder: (context, url) => Container(
        color: plColor ?? AppColors.placeholderImageColor,
      ),
      errorWidget: (context, url, error) => Container(
        color: AppColors.placeholderImageColor,
      ), 
      imageUrl: url,
      fit: BoxFit.cover,
      color: imageColor ?? null,
    );
  }else if(height == 0){
    return CachedNetworkImage(
      placeholder: (context, url) => Container(
        width: width,
        color: plColor ?? AppColors.placeholderImageColor,
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        color: AppColors.placeholderImageColor,
      ), 
      imageUrl: url,
      fit: BoxFit.cover,
      width: width,
      color: imageColor ?? null,
    );
  }else{
    return CachedNetworkImage(
      placeholder: (context, url) => const SizedBox.shrink(),
      errorWidget: (context, url, error) => const SizedBox.shrink(), 
      imageUrl: url,
      fit: BoxFit.cover,
      width: width,
      height: height,
      color: imageColor ?? null,
    );
  }

}
