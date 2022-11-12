import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/product.dart';
import 'package:tika_store/providers/detail_product_provider.dart';
import 'package:tika_store/screens/detail/ProductImageSlider/product_image_slider.dart';
import 'package:tika_store/screens/detail/ProductSummary/product_sumary.dart';
import 'package:tika_store/screens/detail/ProductVariant/product_variant.dart';

class DetailScreen extends StatefulWidget {
  DataProduct product;
  DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    final detailProvider =
        Provider.of<DetailProductProvider>(context, listen: false);
    detailProvider.getImages(widget.product.idProduct);
    detailProvider.getVariant(widget.product.idProduct);
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
                  ? Flexible(
                      child: ListView(
                      shrinkWrap: true,
                      children: [
                        ProductImageSlider(
                            onChangeSlider: state.onChangeImageDetail,
                            currentSlider: state.currentImage,
                            images: state.images.data),
                        ProductSumary(product: widget.product),
                        ProductVariant()
                      ],
                    ))
                  : const Text("Loading..."))),
    );
  }
}
