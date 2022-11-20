// ignore_for_file: must_be_immutable

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/address.dart';
import 'package:tika_store/providers/profile_provider.dart';
import 'package:tika_store/widgets/button/tika_button.dart';
import 'package:tika_store/widgets/text_input_remove_border/text_input_no_border.dart';

class ProfileChangeAddress extends StatelessWidget {
  DataAddress address;
  ProfileChangeAddress({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Edit Address"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Consumer<ProfileProvider>(
            builder: (_,state,__) {
              state.provinceController.text = address.addressProvince!;
              state.districtController.text = address.addressDistrict!;
              state.communeController.text = address.addressCommune!;
              state.specificController.text = address.addressSpecific!;
              return Column(
                children: [
                  TextInputNoBorder(
                    controller: state.provinceController,
                    labelText: "Province", 
                    validator: (value){},
                    icon: FluentIcons.map_20_regular,
                  ),
                  const SizedBox(height: 8),
                  TextInputNoBorder(
                    controller: state.districtController,
                    labelText: "District", 
                    validator: (value){},
                    icon: FluentIcons.city_20_regular,
                  ),
                  const SizedBox(height: 8),
                  TextInputNoBorder(
                    controller: state.communeController,
                    labelText: "Commune", 
                    validator: (value){},
                    icon: FluentIcons.beach_20_regular,
                  ),
                  const SizedBox(height: 8),
                  TextInputNoBorder(
                    controller: state.specificController,
                    labelText: "Specific", 
                    validator: (value){},
                    icon: FluentIcons.home_person_20_regular,
                  ),
                  const SizedBox(height: 20),
                  TikaButton(
                    label: "Save", 
                    width: widthP(context)/2,
                    height: 55,
                    onTap: (){}
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
