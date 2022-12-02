// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:tika_store/configs/share_prefs.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/auth.dart';
import 'package:tika_store/providers/profile_provider.dart';
import 'package:tika_store/services/auth_request.dart';

class AuthProvider extends ProfileProvider {
  AuthModel? _account = AuthModel();
  bool _loadingAuth = false;
  bool _obscureText = true;
  final _formKeySignIn = GlobalKey<FormState>();
  final _formKeySignUp = GlobalKey<FormState>();
  final _formKeyUpdate = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  AuthModel? get account => _account;
  bool get loadingAuth => _loadingAuth;
  bool get obscureText => _obscureText;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get rePasswordController => _rePasswordController;
  GlobalKey<FormState> get formKeySignIn => _formKeySignIn;
  GlobalKey<FormState> get formKeySignUp => _formKeySignUp;
  GlobalKey<FormState> get formKeyUpdate => _formKeyUpdate;

  Future<void> login(context) async {
    try {
      _loadingAuth = true;
      if (_formKeySignIn.currentState!.validate()) {
        final loginInfo = <String, String>{
          "email": _emailController.text,
          "password": _passwordController.text
        };
        final accountData = await AuthService.login(loginInfo);
        _account = accountData;
        if (accountData?.data != null && accountData?.data?.id != null) {
          await setStringStorage('id_user', _account!.data!.id.toString());
          await setStringStorage('name_user',"${_account!.data!.firstName} ${_account!.data!.lastName}");
          await setStringStorage('email_user', _account!.data!.email);
          await setStringStorage('accessToken', _account!.accessToken);
          getStoredProfile().then((value) => print("UID => $uid"));
        }
        TikaToast.showToast(context, accountData!.message);
        Navigator.pop(context);
        clearInput();
        _loadingAuth = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error in login provider $e");
    }
  }

  Future<void> updateUser(context) async {
    try {
      _loadingAuth = true;
      if (_formKeyUpdate.currentState!.validate()) {
        final userData = <String, String>{
          "firstName" : _firstNameController.text,
          "lastName" : _lastNameController.text,
          "email": _emailController.text,
          "phone": _phoneController.text,
          "currentPassword": _passwordController.text,
          "newPassword" : _rePasswordController.text
        };
        print(userData);
        final token = await getStringStorage('accessToken');
        final accountData = await AuthService.updateUser(token, userData);
        _account = accountData;
        if (accountData.data != null && accountData.data?.id != null) {
          await setStringStorage('id_user', _account!.data!.id.toString());
          await setStringStorage('name_user',"${_account!.data!.firstName} ${_account!.data!.lastName}");
          await setStringStorage('email_user', _account!.data!.email);
          await setStringStorage('accessToken', _account!.accessToken);
          getStoredProfile().then((value) => print("UID => $uid"));
        }
        Navigator.pop(context);
        TikaToast.showToast(context, accountData.message);
        _loadingAuth = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error in update user provider $e");
    }
  }

  /* Register Function */
  Future<void> register(context) async {
    if (_formKeySignUp.currentState!.validate()) {
      try {
        _loadingAuth = true;
        final newAccount = <String, String>{
          "firstName": _firstNameController.text,
          "lastName": _lastNameController.text,
          "email": _emailController.text,
          "phone": _phoneController.text,
          "password": _passwordController.text
        };
        final AuthModel? accountData = await AuthService.register(newAccount);
        _account = accountData;
        if (accountData?.data != null && accountData?.data?.id != null) {
          await setStringStorage('id_user', _account!.data!.id.toString());
          await setStringStorage('name_user',"${_account!.data!.firstName} ${_account!.data!.lastName}");
          await setStringStorage('email_user', _account!.data!.email);
          await setStringStorage('accessToken', _account!.accessToken);
          getStoredProfile();
        }
        TikaToast.showToast(context, accountData!.message);
        Navigator.pop(context);
        _loadingAuth = false;
        clearInput();
        notifyListeners();
      } catch (e) {
        _loadingAuth = false;
        notifyListeners();
        debugPrint("Error in register provider:  $e");
      }
    }
  }

  Future<void> logout() async {
    _loadingAuth = true;
    try {
      final token = await getStringStorage('accessToken');
      final logoutData = await AuthService.logout(token);
      await logoutProfile();
      _account = logoutData;
      _loadingAuth = false;
      notifyListeners();
    } catch (e) {
      _loadingAuth = false;
      notifyListeners();
      debugPrint("Error in logout: ${e}");
    }
  }

  void changeObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  /* Clear input */

  void clearInput() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _rePasswordController.clear();
    _phoneController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _phoneController.dispose();
  }
}
