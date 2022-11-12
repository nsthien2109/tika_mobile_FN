import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tika_store/configs/theme.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 2,
        title: Container(
          margin: const EdgeInsets.only(bottom: 5),
          height: 50,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TextFormField(
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.greyDarker
                ),
                decoration: const  InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Search products ...",
                  hintStyle: TextStyle(
                    color: AppColors.blackLighter, 
                    fontSize: 12
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 45,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )
                  ),
                  child: const Icon(FluentIcons.search_12_regular,size: 20, color: AppColors.white,)
                ),
              )
            ],
          ),
        ),
        toolbarHeight: 60.0,
      ),
      body: const SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          primary: false,
          slivers: [
            
          ],
        )
      ),
    );
  }
}