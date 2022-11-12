import 'package:flutter/material.dart';

class NavigateProvider extends ChangeNotifier {
  int _currentTabPage = 0;

  int get currentTabPage => _currentTabPage;

  void onChangeTabPage(int value) {
    _currentTabPage = value;
    notifyListeners();
  }
}
