import 'package:flutter/material.dart';
import 'package:tika_store/configs/responsive.dart';

class SectionTitle extends StatelessWidget {
  String sectionTitle;
  SectionTitle({super.key, required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthP(context),
      padding: const EdgeInsets.all(10),
      child: Text(sectionTitle, style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500
        )
      ),
    );
  }
}