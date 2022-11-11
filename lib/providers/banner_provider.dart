import 'package:flutter/cupertino.dart';
import 'package:tika_store/models/banner.dart';
import 'package:tika_store/services/banner_request.dart';

class BannerProvider extends ChangeNotifier {
  BannerModel _banners = BannerModel();
  int _currentSlider = 0;

  BannerModel get banners => _banners;
  int get currentSlider => _currentSlider;

  BannerProvider() {
    getBanners();
  }

  Future getBanners() async {
    final BannerModel? banner = await BannerService.getBanners();
    _banners = banner ?? BannerModel();
    notifyListeners();
  }

  void onChangeSlider(value) {
    _currentSlider = value;
    notifyListeners();
  }
}
