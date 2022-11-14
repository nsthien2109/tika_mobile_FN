import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/search_provider.dart';
import 'package:tika_store/widgets/empty_result/empty_result.dart';
import 'package:tika_store/widgets/product_grid_card/product_grid_card.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (_,state,__) => Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 2,
            title: Container(
              margin: const EdgeInsets.only(bottom: 5),
              height: 50,
              child: Form(
                key: state.formKey,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    TextFormField(
                      controller: state.searchController,
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
                      child: GestureDetector(
                        onTap: state.getProducts,
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
                      ),
                    )
                  ],
                ),
              ),
            ),
            toolbarHeight: 60.0,
          ),
          body: SafeArea(
            child: CustomScrollView(
              shrinkWrap: true,
              primary: false,
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate(
                    [
                      _buildSearchResults(context,state.products.data?.data)
                    ]
                  )
                ),
              ],
            )
          ),
        )
    );
  }

  Widget _buildSearchResults(BuildContext context,products){
    final imageSize = (widthP(context) - 24) / 2 - 12;
    if(products != null){
      if(products.length == 0){
        return const EmptyResult();
      }
      return GridView.count(
          padding: const EdgeInsets.all(10),
          primary: false,
          childAspectRatio: 5 / 8,
          shrinkWrap: true,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          children: List.generate(
            products?.length ?? 0, 
            (index) => ProductGridCard(
              product: products![index],
            )
          ),
      );
    }else{
      return ShimmerLoading().buildShimmerProduct(imageSize);
    }
  }
}