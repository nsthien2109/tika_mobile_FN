import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';

class ProfileWithoutLoginScreen extends StatelessWidget {
  const ProfileWithoutLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
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
                  child: Row(
                    children: [
                      Image.asset('assets/images/user_ukn.png',width: 80,),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: TextButton(
                                onPressed: ()=> Navigator.pushNamed(context,'/sign_in'), 
                                child: const Text("Sign In", 
                                  style: TextStyle(
                                    color: AppColors.white, 
                                    fontWeight: FontWeight.w300
                                    )
                                  )
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.primary)
                              ),
                              child: TextButton(
                                onPressed: ()=> Navigator.pushNamed(context,'/sign_up'),  
                                child: const Text("Sign Up", style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w300
                                ))
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ),
              const SizedBox(height: 16),
              _buildSettingItem(context,"Language",(){}),
              _buildSettingItem(context,"About",(){}),
              _buildSettingItem(context,"Terms and Conditions",(){}),
              _buildSettingItem(context,"Privacy Policy",(){}),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildSettingItem(context, title,Function() onTap){
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
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
      ),
    );
  }
}