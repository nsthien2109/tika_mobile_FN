import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/navigate_provider.dart';
import 'package:tika_store/screens/auth/sign_in_screen.dart';
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
      SignInScreen(),
    ];

    return Consumer<NavigateProvider>(
      builder: (_,state,__)  => Scaffold(
          body: tikaMainPage.elementAt(state.currentTabPage),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentTabPage,
            iconSize: 20,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.greyDarker.withOpacity(.5),
            onTap: (index) => state.onChangeTabPage(index),
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
                  label: "Settings", icon: Icon(FluentIcons.app_folder_16_regular)),
            ],
          ),
        )
    );
  }
}
