import 'package:flutter/cupertino.dart';
import 'package:tika_store/models/image.dart';
import 'package:tika_store/models/variant.dart';
import 'package:tika_store/services/image_request.dart';
import 'package:tika_store/services/variant_request.dart';

class DetailProductProvider extends ChangeNotifier {
  ImageModel _images = ImageModel();
  VariantModel _variant = VariantModel();
  int _currentImage = 0;
  bool _loadingDetail = false;

  ImageModel get images => _images;
  VariantModel get variant => _variant;
  bool get loadingDetail => _loadingDetail;
  int get currentImage => _currentImage;

  Future<void> getImages(idProduct) async {
    _loadingDetail = true;
    final ImageModel? images = await ImageService.getImages(idProduct);
    _images = images ?? ImageModel();
    _loadingDetail = false;
    notifyListeners();
  }

  Future<void> getVariant(idProduct) async {
    _loadingDetail = true;
    final VariantModel? variant = await VariantService.getVariants(idProduct);
    _variant = variant ?? VariantModel();
    _loadingDetail = false;
    notifyListeners();
  }

  void onChangeImageDetail(int value) {
    _currentImage = value;
    notifyListeners();
  }
}
