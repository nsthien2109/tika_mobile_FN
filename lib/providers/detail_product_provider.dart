import 'package:flutter/cupertino.dart';
import 'package:tika_store/models/comment.dart';
import 'package:tika_store/models/image.dart';
import 'package:tika_store/models/variant.dart';
import 'package:tika_store/services/comment_request.dart';
import 'package:tika_store/services/image_request.dart';
import 'package:tika_store/services/variant_request.dart';

class DetailProductProvider extends ChangeNotifier {
  ImageModel _images = ImageModel();
  VariantModel _variant = VariantModel();
  CommentModel _comments = CommentModel();
  int _currentImage = 0;
  bool _loadingDetail = false;
  DataSize _selectedSize = DataSize();
  DataColor _selectedColor = DataColor();

  ImageModel get images => _images;
  VariantModel get variant => _variant;
  CommentModel get comments => _comments;
  bool get loadingDetail => _loadingDetail;
  int get currentImage => _currentImage;
  DataSize get selectedSize => _selectedSize;
  DataColor get selectedColor => _selectedColor;

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
    if(_variant.data!.sizes!.isNotEmpty){
      _selectedSize = _variant.data?.sizes?[0] ?? DataSize();
    }
    if(_variant.data!.colors!.isNotEmpty){
      _selectedColor = _variant.data?.colors?[0] ?? DataColor();
    }
    _loadingDetail = false;
    notifyListeners();
  }

  Future<void> getComments(idProduct) async {
    _loadingDetail = true;
    final CommentModel? comments = await CommentService.getComments(idProduct);
    _comments = comments ?? CommentModel();
    _loadingDetail = false;
    notifyListeners();
  }



  void onChangeSize(size) {
    _selectedSize = size;
    notifyListeners();
  }

  void onChangeColor(color) {
    _selectedColor = color;
    notifyListeners();
  }

  void onChangeImageDetail(int value) {
    _currentImage = value;
    notifyListeners();
  }
}
