import 'package:flutter/cupertino.dart';
import 'package:tika_store/configs/share_prefs.dart';
import 'package:tika_store/models/order.dart';
import 'package:tika_store/models/order_detail.dart';
import 'package:tika_store/services/order_request.dart';

class OrderProvider extends ChangeNotifier {
  
  OrderModel _orderList = OrderModel();
  OrderDetailModel _orderDetail = OrderDetailModel();
  bool? _orderLoading = false;

  OrderModel get orderList => _orderList;
  OrderDetailModel get orderDetail => _orderDetail;
  bool? get orderLoading => _orderLoading;

  // Get order
  Future getOrders() async {
    _orderLoading = true;
    try {
      final token = await getStringStorage('accessToken');
      final responseOrder = await OrderService.getOrders(token);
      _orderList = responseOrder;
      _orderLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint("Getting order failed provider : $e");
    }
  }

  Future getDetailOrder(id) async {
    _orderLoading = true;
    try {
      final token = await getStringStorage('accessToken');
      final responseOrderDetail = await OrderService.getOrderDetail(token,id);
      _orderDetail = responseOrderDetail;
      _orderLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint("Getting order detail failed provider : $e");
    }
  }


}
