import 'package:flutter/cupertino.dart';
import 'package:tika_store/configs/share_prefs.dart';

class ProfileProvider extends ChangeNotifier {
  int? _uid; // user id
  String? _uname; // user name
  String? _uemail; // user email

  int? get uid => _uid;
  String? get uname => _uname;
  String? get uemail => _uemail;

  ProfileProvider() {
    getStoredProfile();
  }

  Future getStoredProfile() async {
    final userId = await getStringStorage('id_user');
    final userName = await getStringStorage('name_user');
    final userEmail = await getStringStorage('email_user');
    await getStringStorage('accessToken');
    if (userId != null) {
      _uid = int.parse(userId);
    }
    _uname = userName;
    _uemail = userEmail;
    notifyListeners();
  }

  Future<void> logoutProfile() async {
    await resetStorage();
    _uid = null;
    _uname = null;
    _uemail = null;
    print("Updated uid $_uid");
    notifyListeners();
  }
}
