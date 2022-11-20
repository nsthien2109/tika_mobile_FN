import 'package:flutter/material.dart';
import 'package:tika_store/configs/theme.dart';

class AppStyle{
  static const TextStyle authTitle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.primary
  );

  static const TextStyle productName = TextStyle(
      fontSize: 15,
      color: AppColors.blackLighter
  );

  static const TextStyle productPrice = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold
  );

  static const TextStyle productTotalReview = TextStyle(
      fontSize: 11,
      color: AppColors.greyLighter
  );

  static const TextStyle productSale = TextStyle(
      fontSize: 11,
      color: AppColors.greyLighter
  );

  static const TextStyle detailProductPrice = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold
  );
  static const TextStyle sectionTitle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500
  );
  static const TextStyle viewAll = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: AppColors.primary
  );
  static const TextStyle addressTitle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  static const TextStyle addressContent = TextStyle(
      fontSize: 12
  );

  static const TextStyle addressAction = TextStyle(
      fontSize: 14,
      color: AppColors.primary
  );
}