// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/theme.dart';

class TextInputNoBorder extends StatelessWidget {
  String labelText;
  TextEditingController? controller;
  Function(String value)? onChanged;
  Function(String value) validator;
  IconData? icon;
  bool? obscureText;
  Function? changeObscureText;
  String? initialValue;
  TextInputNoBorder({
    Key? key,
    required this.labelText ,
    this.controller, 
    this.icon ,
    this.onChanged, 
    required this.validator, 
    this.obscureText,
    this.changeObscureText,
    this.initialValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText ?? false,
      validator: (value) => validator(value!),
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      style: const TextStyle(color: AppColors.greyDarker),
      onChanged: onChanged,
      decoration:  InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.white, width: 2.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        hintText: labelText,
        hintStyle: const TextStyle(
          color: AppColors.blackLighter, 
        ),
        suffixIcon: GestureDetector(
          onTap: ()=> changeObscureText != null ? changeObscureText!() : null,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.8),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(
              icon,
              color: AppColors.white,
            )
          )
        )
      ),
    );
  }
}
