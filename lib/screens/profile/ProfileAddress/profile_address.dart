import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tika_store/configs/styles.dart';
import 'package:tika_store/models/address.dart';

class ProfileAddress extends StatelessWidget {
  DataAddress? address;
  ProfileAddress({Key? key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Address"),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              FluentIcons.add_16_filled,
              size: 20,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
             address?.idAddress != null ? _buildAddressCard(context,address!) : const SizedBox.shrink()
            ],
        ),
      ),
    );
  }

  Widget _buildAddressCard(context,DataAddress address) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 6, 12, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${address.addressProvince}", style: AppStyle.addressTitle),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text("${address.firstName}  ${address.lastName}",
                    style: AppStyle.addressContent),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text("${address.phone}", style: AppStyle.addressContent),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text("${address.addressProvince}", style: AppStyle.addressContent),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text("${address.addressDistrict}", style: AppStyle.addressContent),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text("${address.addressCommune}", style: AppStyle.addressContent),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text("${address.addressSpecific}",style: AppStyle.addressContent),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: ()=> Navigator.pushNamed(context, '/edit_address', arguments: address),
                        child:
                            const Text('Edit', style: AppStyle.addressAction),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child:
                            const Text('Delete', style: AppStyle.addressAction),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
