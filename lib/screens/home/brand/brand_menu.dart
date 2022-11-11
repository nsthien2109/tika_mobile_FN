import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/category_provider.dart';
import 'package:tika_store/widgets/cache_image/cache_image_network.dart';

class BrandMenu extends StatelessWidget {
  const BrandMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (_,state,__) => Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: widthP(context),
          child: GridView.count(
            mainAxisSpacing: 10,
            childAspectRatio: 1,
            crossAxisSpacing: 1,
            shrinkWrap: true,
            crossAxisCount: 1,
            scrollDirection: Axis.horizontal,
            children: state.categories.data != null ? List.generate(state.categories.data!.length, (index) => 
              GestureDetector(
                onTap: ()=> debugPrint("You are clicked on category ${state.categories.data?[index].categoryName}"),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Opacity(
                        opacity: .7,
                        child: cacheImageNetwork(
                          width: widthP(context), 
                          height: 0, 
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
            ) : [] ,
          ),
        )
    );
  }
}