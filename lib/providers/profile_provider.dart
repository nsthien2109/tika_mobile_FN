import 'package:flutter/cupertino.dart';
import 'package:tika_store/configs/share_prefs.dart';
import 'package:tika_store/models/address.dart';
import 'package:tika_store/models/auth.dart';
import 'package:tika_store/models/wishlist.dart';
import 'package:tika_store/providers/cart_provider.dart';
import 'package:tika_store/services/profile_request.dart';

class ProfileProvider extends CartProvider {
  int? _uid; // user id
  String? _uname; // user name
  String? _uemail; // user email
  DataUser? _user;
  AddressModel? _address = AddressModel();
  WishListModel? _wishlist = WishListModel();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  //address form controller
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _communeController = TextEditingController();
  final TextEditingController _specificController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int? get uid => _uid;
  String? get uname => _uname;
  String? get uemail => _uemail;
  DataUser? get user => _user;
  AddressModel? get address => _address;
  WishListModel? get wishlist => _wishlist;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get emailController => _emailController;
  TextEditingController get oldPasswordController => _oldPasswordController;
  TextEditingController get newPasswordController => _newPasswordController;
  //address form controller
  TextEditingController get provinceController => _provinceController;
  TextEditingController get districtController => _districtController;
  TextEditingController get communeController => _communeController;
  TextEditingController get specificController => _specificController;
  GlobalKey<FormState> get formKey => _formKey;

  ProfileProvider() {
    getStoredProfile();
  }

  Future getStoredProfile() async {
    final userId = await getStringStorage('id_user');
    final userName = await getStringStorage('name_user');
    final userEmail = await getStringStorage('email_user');
    if (userId != null) {
      _uid = int.parse(userId);
      getProfile();
      getAddress();
      getCart();
      getOrders();
      getWishList();
    }
    _uname = userName;
    _uemail = userEmail;
    notifyListeners();
  }

  Future getProfile() async {
    final token = await getStringStorage('accessToken');
    final DataUser userData = await ProfileService.getProfile(token);
    _user = userData;
    notifyListeners();
  }

  Future getAddress() async {
    final token = await getStringStorage('accessToken');
    final AddressModel addressData = await ProfileService.getAddress(token);
    _address = addressData;
    notifyListeners();
  }

  Future getWishList() async {
    final token = await getStringStorage('accessToken');
    final WishListModel wishlistData = await ProfileService.getWishList(token);
    _wishlist = wishlistData;
    notifyListeners();
  }

  Future<void> logoutProfile() async {
    _uid = null;
    _uname = null;
    _uemail = null;
    _user = DataUser();
    _wishlist = WishListModel();
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _provinceController.clear();
    _districtController.clear();
    _communeController.clear();
    _specificController.clear();
    await resetStorage();
    notifyListeners();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _provinceController.dispose();
    _districtController.dispose();
    _communeController.dispose();
    _specificController.dispose();
    super.dispose();
  }
}
