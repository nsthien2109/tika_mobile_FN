import 'package:flutter/cupertino.dart';
import 'package:tika_store/configs/share_prefs.dart';
import 'package:tika_store/models/cart.dart';
import 'package:tika_store/providers/order_provider.dart';
import 'package:tika_store/services/cart_request.dart';

class CartProvider extends OrderProvider {
  CartModel _cartList = CartModel();
  bool? _cartLoading = false;

  CartModel get cartList => _cartList;
  bool? get cartLoading => _cartLoading;

  double? get totalCart {
    if (!_cartList.data!.isNotEmpty) {
      return 0.0;
    }else{
      return _cartList.data?.map((item) => item.productPrice! * (item.quantity as num)).reduce((value, current) => value + current) ?? 0.0;
    }
  }

  // Get home products
  Future getCart() async {
    _cartLoading = true;
    try {
      final token = await getStringStorage('accessToken');
      final CartModel responseCart = await CartService.getCart(token);
      _cartList = responseCart;
      _cartLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint("Getting cart failed provider : $e");
    }
  }

  void addtoCart(cartData) async {
    _cartLoading = true;
    try {
      final token = await getStringStorage('accessToken');
      final responseCart = await CartService.addCart(cartData, token);
      final checkCart = _cartList.data
          ?.where((element) => element.idProduct == responseCart.idProduct);
      if (checkCart?.isEmpty == true && responseCart.idCart != null) {
        print("CHECK TRUE");
        _cartList.data?.add(responseCart);
        _cartLoading = false;
        notifyListeners();
      } else if (responseCart.idCart != null) {
        print("CHECK FALSE");
        for (var cart in _cartList.data!) {
          if (cart.idProduct == responseCart.idProduct) {
            cart.quantity = cart.quantity ?? 0 + 1;
            _cartLoading = false;
            notifyListeners();
            break;
          }
        }
      }
    } catch (e) {
      _cartLoading = false;
      debugPrint("Sai ở thêm vào giỏ hàng provider : ---> $e");
    }
  }

  void addQuantity(DataCart cartItem) {
    for (var i = 0; i < _cartList.data!.length; i++) {
      if (_cartList.data![i].idCart == cartItem.idCart) {
        _cartList.data![i].quantity = _cartList.data![i].quantity! + 1;
        notifyListeners();
        break;
      }
    }
  }

  void minusQuantity(DataCart cartItem) {
    for (var i = 0; i < _cartList.data!.length; i++) {
      if (_cartList.data![i].idCart == cartItem.idCart) {
        if (_cartList.data![i].quantity == 1) {
          break;
        } else {
          _cartList.data![i].quantity = _cartList.data![i].quantity! - 1;
          notifyListeners();
        }
        break;
      }
    }
  }
}
