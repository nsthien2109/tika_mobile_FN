import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/styles.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/configs/validate.dart';
import 'package:tika_store/providers/auth_provider.dart';
import 'package:tika_store/widgets/button/tika_button.dart';
import 'package:tika_store/widgets/text_input/text_input.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: widthP(context),
        child: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children : [
                Container(
                  width: widthP(context),
                  height: widthP(context)/2,
                  padding: const EdgeInsets.all(10),
                  decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      topRight: Radius.circular(80),                  
                    ),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary,
                        AppColors.red
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tika".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 28,
                            fontFamily: 'TitanOne', color: AppColors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Image.asset('assets/images/signup_sticker.png', width: widthP(context) / 3)
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  child: IconButton(
                    onPressed: ()=> Navigator.pop(context), 
                    icon: const Icon(FluentIcons.chevron_left_12_filled, color: AppColors.white)
                  ),
                ),
              ] 
            ),
            Consumer<AuthProvider>(
              builder: (_,state,__) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Form(
                    key: state.formKeySignUp,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        const Text("Sign Up", style: AppStyle.authTitle),
                        const SizedBox(height: 20),
                        TextInput(
                          labelText: "First Name",
                          controller: state.firstNameController,
                          validator: (value) => TikaValidate.textBoxValidate(value),
                        ),
                        const SizedBox(height: 10),
                        TextInput(
                          labelText: "Last Name",
                          validator: (value) => TikaValidate.textBoxValidate(value),
                          controller: state.lastNameController,
                        ),
                        const SizedBox(height: 10),
                        TextInput(
                          labelText: "Email",
                          controller: state.emailController,
                          validator: (value) => TikaValidate.emailValidate(value),
                        ),
                        const SizedBox(height: 10),
                        TextInput(
                          labelText: "Phone Number",
                          controller: state.phoneController,
                          validator: (value) => TikaValidate.phoneValidate(value),
                        ),
                        const SizedBox(height: 10),
                        TextInput(
                          labelText: "Password",
                          controller: state.passwordController,
                          icon: FluentIcons.eye_16_regular,
                          obscureText: state.obscureText,
                          changeObscureText: state.changeObscureText,
                          validator: (value) => TikaValidate.passwordValidate(value),
                        ),  
                        const SizedBox(height: 10),
                        TextInput(
                          labelText: "Re-enter Password",
                          icon: FluentIcons.eye_16_regular,
                          obscureText: state.obscureText,
                          controller: state.rePasswordController,
                          changeObscureText: state.changeObscureText,
                          validator: (value) => TikaValidate.rePasswordValidate(value, state.passwordController.text),
                        ),     
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: (){}, 
                            child: const Text("Forgot Password ?",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.greyDarker
                              ),
                            )
                          ),
                        ),   
                        const SizedBox(height: 10),
                        TikaButton(
                          label: "Sign Up",
                          isLoading: state.loadingAuth,
                          onTap: ()=> state.register(context),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Adreadly account ?",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.blackLighter
                                ),
                              ),
                              TextButton(
                                onPressed: (){}, 
                                child: const Text("Sign In",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black
                                  ),
                                )
                              )
                            ],
                          )
                        ),        
                      ],
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}