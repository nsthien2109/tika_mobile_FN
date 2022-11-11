import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/config.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/providers/banner_provider.dart';
import 'package:tika_store/widgets/cache_image/cache_image_network.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class SlideShow extends StatelessWidget {
  const SlideShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BannerProvider>(
        builder: (_, state, __) => state.banners.data != null ?  Container(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              CarouselSlider(
                items: state.banners.data?.map((item) => GestureDetector(
                    onTap: () => Fluttertoast.showToast(msg: 'Click banner ${item.idBanner}',toastLength: Toast.LENGTH_SHORT),
                    child: cacheImageNetwork(width: widthP(context), height: 0, url: '$server/${item.bannerImage}'))).toList(),
                options: CarouselOptions(
                  aspectRatio: 2,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 6),
                  autoPlayAnimationDuration: const Duration(milliseconds: 300),
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) => state.onChangeSlider(index),
                ), 
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.banners.data!.map((item) {
                    int index = state.banners.data!.indexOf(item);
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: state.currentSlider == index?10:5,
                      height: state.currentSlider == index?10:5,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ) ,
          ],
      ),
        ) : ShimmerLoading().buildShimmerBanner(widthP(context), 200.0)
    );
  }
}
