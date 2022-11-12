// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/theme.dart';

class TextInput extends StatelessWidget {
  String labelText;
  TextEditingController? controller;
  Function(String value)? onChanged;
  IconData? icon;
  TextInput({Key? key,required this.labelText ,this.controller, this.icon ,this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      style: const TextStyle(color: AppColors.greyDarker),
      onChanged: onChanged,
      decoration:  InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 2.0)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyLighter),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.blackLighter, 
          fontSize: 12
        ),
        suffixIcon: IconButton(onPressed: (){}, icon: Icon(icon))
      ),
    );
  }
}
