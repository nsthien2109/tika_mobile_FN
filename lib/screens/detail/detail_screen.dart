// ignore_for_file: must_be_immutable

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/product.dart';
import 'package:tika_store/providers/category_provider.dart';
import 'package:tika_store/providers/detail_product_provider.dart';
import 'package:tika_store/screens/detail/ProductDescription/product_description.dart';
import 'package:tika_store/screens/detail/ProductImageSlider/product_image_slider.dart';
import 'package:tika_store/screens/detail/ProductInfomation/product_infomation.dart';
import 'package:tika_store/screens/detail/ProductRate/product_rate.dart';
import 'package:tika_store/screens/detail/ProductRelated/product_related.dart';
import 'package:tika_store/screens/detail/ProductSummary/product_sumary.dart';
import 'package:tika_store/screens/detail/ProductVariant/product_variant.dart';
import 'package:tika_store/widgets/button/tika_button.dart';
import 'package:tika_store/widgets/comming_soon/comming_soon.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class DetailScreen extends StatefulWidget {
  DataProduct product;
  DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    final detailProvider = Provider.of<DetailProductProvider>(context, listen: false);
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    detailProvider.getImages(widget.product.idProduct);
    detailProvider.getVariant(widget.product.idProduct);
    detailProvider.getComments(widget.product.idProduct);
    categoryProvider.getProductOfCategory(widget.product.idCategory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(FluentIcons.heart_16_regular)),
          IconButton(
              onPressed: () {}, icon: const Icon(FluentIcons.share_16_regular)),
          IconButton(
              onPressed: () {}, icon: const Icon(FluentIcons.cart_16_regular))
        ],
      ),
      body: SafeArea(
          child: Consumer<DetailProductProvider>(
              builder: (_, state, __) => state.loadingDetail == false
                  ? ListView(
                  shrinkWrap: true,
                  children: [
                    ProductImageSlider(
                        onChangeSlider: state.onChangeImageDetail,
                        currentSlider: state.currentImage,
                        images: state.images.data),

                    ProductSumary(product: widget.product),
                    ProductVariant(
                      sizes: state.variant.data?.sizes,
                      colors: state.variant.data?.colors,
                      selectedSize: state.selectedSize,
                      selectedColor: state.selectedColor,
                      onChangeSize: state.onChangeSize,
                      onChangeColor: state.onChangeColor,
                    ),
                    ProductInfomation(
                      product: widget.product,
                    ),
                    ProductDescription(
                      description:
                          widget.product.productDescription.toString(),
                    ),
                    ProductRelated(idProduct: widget.product.idProduct!),
                    ProductRate(comments: state.comments.data),
                    const SizedBox(height: 60),
                  ],
                    )
                  : ShimmerLoading().buildShimmerContent()      
            )
          ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: AppColors.white,
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,  
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.primary
                ),
                borderRadius: BorderRadius.circular(100)
              ),           
              child: GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(
                  builder: (_) => CommingSoon(
                    title: "Chat", imageAssetUrl: "assets/images/chat_sticker.png", backButton: true)
                    )
                  ),
                child: const Icon(FluentIcons.chat_16_regular, color: AppColors.primary)
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TikaButton(
                label: "Add to cart", 
                height: 50,
                onTap: (){},
              )
            )
          ],
        ),
      ),
    );
  }
}
