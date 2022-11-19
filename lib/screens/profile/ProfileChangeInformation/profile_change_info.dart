import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/widgets/button/tika_button.dart';
import 'package:tika_store/widgets/text_input_remove_border/text_input_no_border.dart';

class ProfileChangeInfo extends StatelessWidget {
  const ProfileChangeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: widthP(context)/2,
                  child: Stack(
                    alignment: Alignment.topCenter,             
                    children:[
                      Container(
                        height: widthP(context)/3,
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
                        )
                      ),
                      Positioned(
                        height: widthP(context)/3,
                        top: (widthP(context)/3) / 2,
                        child: Image.asset('assets/images/user_st.png',width: widthP(context)/3)
                      ),
                    ]                  
                  ),
                ),
                const SizedBox(height: 16),
                TextInputNoBorder(
                  labelText: "First name", 
                  validator: (value) {},
                  icon: FluentIcons.edit_20_filled,
                ),
                const SizedBox(height: 8),
                TextInputNoBorder(
                  labelText: "Last name",  
                  validator: (value) {},
                  icon: FluentIcons.edit_20_filled,
                ),
                const SizedBox(height: 8),
                TextInputNoBorder(
                  labelText: "Email", 
                  validator: (value) {},
                  icon: FluentIcons.mail_alert_20_regular,
                ),
                const SizedBox(height: 8),
                TextInputNoBorder(
                  labelText: "Phone Number",  
                  validator: (value) {},
                  icon: FluentIcons.phone_chat_20_regular,
                ),
                const SizedBox(height: 8),
                TextInputNoBorder(
                  labelText: "Password",  
                  validator: (value) {},
                  icon: FluentIcons.eye_20_regular,
                ),
                const SizedBox(height: 8),
                TextInputNoBorder(
                  labelText: "New Password", 
                  validator: (value) {},
                  icon: FluentIcons.eye_20_regular,
                ),
                const SizedBox(height: 16),
                TikaButton(
                  width: widthP(context)/ 2,
                  height: 50,
                  label: "Save", 
                  onTap: (){}
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}