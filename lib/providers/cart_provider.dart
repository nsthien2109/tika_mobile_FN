import 'package:flutter/cupertino.dart';
import 'package:tika_store/configs/share_prefs.dart';
import 'package:tika_store/models/cart.dart';
import 'package:tika_store/models/coupon.dart';
import 'package:tika_store/providers/order_provider.dart';
import 'package:tika_store/services/cart_request.dart';
import 'package:tika_store/services/coupon_request.dart';

class CartProvider extends OrderProvider {
  CartModel _cartList = CartModel();
  CouponModel _coupon = CouponModel();
  bool? _cartLoading = false;
  TextEditingController _couponController = TextEditingController();
  final _formKeyCoupon = GlobalKey<FormState>();

  CartModel get cartList => _cartList;
  CouponModel get coupon => _coupon;
  bool? get cartLoading => _cartLoading;
  TextEditingController get couponController => _couponController;
  GlobalKey<FormState> get formKeyCoupon => _formKeyCoupon;

  double? get totalCart {
    if (_cartList.data?.isEmpty == true || _cartList.data == null) {
      return 0.0;
    } else {
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
      await CartService.addCart(cartData, token);
      getCart();
    } catch (e) {
      _cartLoading = false;
      debugPrint("Sai ở thêm vào giỏ hàng provider : ---> $e");
    }
  }

  void removeCart(idCart) async {
    _cartLoading = true;
    try {
      final token = await getStringStorage('accessToken');
      final removeCartResponse = await CartService.removeCart(token, idCart);
      _cartList.data?.removeWhere((cart) => cart.idCart == removeCartResponse);
      _cartLoading = false;
      notifyListeners();
    } catch (e) {
      _cartLoading = false;
      debugPrint("Sai ở xoa sp giỏ hàng provider : ---> $e");
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

  void checkCouponCode() async {
    _cartLoading = true;
    try {
      final responseCoupon = await CouponService.checkCoupon(_couponController.text);
      _coupon = responseCoupon ?? CouponModel();
      _cartLoading = false;
      notifyListeners();
    } catch (e) {
      _cartLoading = false;
      debugPrint("Check coupon failed provider: $e");
    }
  }
}
