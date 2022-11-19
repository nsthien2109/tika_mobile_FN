import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/auth_provider.dart';
import 'package:tika_store/providers/profile_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: ()=> Navigator.pushNamed(context, '/edit_profile_info'),
              child: const Icon(
                FluentIcons.settings_16_regular
              )
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (_,state,__) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      height: widthP(context) / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greyLighter.withOpacity(.5),
                            blurRadius: 12.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: const Offset(
                              5.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            )
                          )
                        ],
                        color: AppColors.white
                      ),
                      child: GestureDetector(
                        onTap: ()=> Navigator.pushNamed(context, '/edit_profile_info'),
                        child: Row(
                          children: [
                            Image.asset('assets/images/user_st.png',width: 100,),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${state.uname}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Text("${state.uemail}",
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: AppColors.blackLighter
                                    ),
                                  )
                                ],
                              )
                            )
                          ],
                        ),
                      )
                    ),
                    const SizedBox(height: 16),
                    _buildSettingItem(context, "Address"),
                    _buildSettingItem(context, "Wishlist"),
                    _buildSettingItem(context,"Language"),
                    _buildSettingItem(context,"About"),
                    _buildSettingItem(context,"Terms and Conditions"),
                    _buildSettingItem(context,"Privacy Policy"),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: widthP(context),
                      child: GestureDetector(
                        onTap: () => state.logout(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(FluentIcons.sign_out_20_regular, size: 20, color: AppColors.red),
                            SizedBox(width: 10),
                            Text("Sign Out",
                              style: TextStyle(
                                color: AppColors.red
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  Widget _buildSettingItem(context, title){
    return Container(
      width: widthP(context),
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.greyLighter.withOpacity(.6), 
            width: .5
          )
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15
            )
          ),
          const Icon(
            FluentIcons.chevron_right_12_regular,
            size: 15,
          )
        ],
      ),
    );
  }
}