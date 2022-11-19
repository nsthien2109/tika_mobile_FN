// ignore_for_file: deprecated_member_use

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/navigate_provider.dart';
import 'package:tika_store/providers/profile_provider.dart';
import 'package:tika_store/screens/auth/sign_in_screen.dart';
import 'package:tika_store/screens/home/home_screen.dart';
import 'package:tika_store/screens/order/order_screen.dart';
import 'package:tika_store/screens/profile/profile_screen.dart';
import 'package:tika_store/widgets/comming_soon/comming_soon.dart';

class NavigateView extends StatelessWidget {
  const NavigateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<NavigateProvider,ProfileProvider>(builder: (context, navState, profileState, __) {
      return Scaffold(
        body: PageView(
          onPageChanged: (value) => navState.onChangeTabPage(value),
          controller: navState.pageController,
          scrollBehavior: const ScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch
          ),
          children: [
            const HomeScreen(),
            CommingSoon(imageAssetUrl: 'assets/images/chat_sticker.png',title: "Chat"),
            const OrderScreen(),
            CommingSoon(imageAssetUrl: 'assets/images/notify_sticker.png', title: "Notification"),
            profileState.uid != null ? const ProfileScreen() : const SignInScreen()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navState.currentTabPage,
          iconSize: 20,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.greyDarker.withOpacity(.5),
          onTap: (index) => navState.onChangeTabPage(index),
          items: const [
            BottomNavigationBarItem(
                label: "Home", icon: Icon(FluentIcons.home_16_regular)),
            BottomNavigationBarItem(
                label: "Chat", icon: Icon(FluentIcons.chat_16_regular)),
            BottomNavigationBarItem(
                label: "Order", icon: Icon(FluentIcons.list_16_regular)),
            BottomNavigationBarItem(
                label: "Notification",
                icon: Icon(FluentIcons.alert_16_regular)),
            BottomNavigationBarItem(
                label: "Settings",
                icon: Icon(FluentIcons.app_folder_16_regular)),
          ],
        ),
      );
    });
  }
}
