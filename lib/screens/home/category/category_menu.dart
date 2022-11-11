import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/category_provider.dart';
import 'package:tika_store/widgets/cache_image/cache_image_network.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (_,state,__) => state.categories.data != null ?  Container(
          padding: const EdgeInsets.all(10),
          height: 180,
          width: widthP(context),
          child: GridView.count(
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            shrinkWrap: true,
            crossAxisCount: 2,
            scrollDirection: Axis.horizontal,
            childAspectRatio: .9,
            children: List.generate(state.categories.data!.length, (index) => 
              GestureDetector(
                onTap: ()=> debugPrint("You are clicked on category ${state.categories.data?[index].categoryName}"),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: AppColors.black,
                      child: Opacity(
                        opacity: .7,
                        child: cacheImageNetwork(
                          height: 0, 
                          width: widthP(context),
                          url: '$server/${state.categories.data?[index].categoryImage}',                          
                        )
                      ),
                    ),
                    Text(
                      "${state.categories.data?[index].categoryName}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 13
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
        ) : ShimmerLoading().buildShimmerCategory()
    );
  }
}