import 'package:flutter/cupertino.dart';

class NavigateProvider extends ChangeNotifier {
  int _currentTabPage = 0;
  final PageController _pageController = PageController();
  int get currentTabPage => _currentTabPage;
  PageController get pageController => _pageController;

  void onChangeTabPage(int value) {
    _pageController.jumpToPage(value);
    _currentTabPage = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    notifyListeners();
    super.dispose();
  }
}
