import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/screens/home/home_screen.dart';

class NavigateView extends StatelessWidget {
  const NavigateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tikaMainPage = [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];

    return Scaffold(
      body: tikaMainPage.elementAt(0),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        iconSize: 20,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.greyDarker.withOpacity(.5),
        onTap: (index) => {},
        items: const [
          BottomNavigationBarItem(
              label: "Home", icon: Icon(FluentIcons.home_16_regular)),
          BottomNavigationBarItem(
              label: "Chat", icon: Icon(FluentIcons.chat_16_regular)),
          BottomNavigationBarItem(
              label: "Order", icon: Icon(FluentIcons.list_16_regular)),
          BottomNavigationBarItem(
              label: "Notification", icon: Icon(FluentIcons.alert_16_regular)),
          BottomNavigationBarItem(
              label: "More", icon: Icon(FluentIcons.app_folder_16_regular)),
        ],
      ),
    );
  }
}
