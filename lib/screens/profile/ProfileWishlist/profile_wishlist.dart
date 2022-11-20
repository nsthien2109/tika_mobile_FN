// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/profile_provider.dart';
import 'package:tika_store/screens/profile/ProfileWishlist/wishlist_card.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class ProfileWishList extends StatefulWidget {
  ProfileWishList({Key? key}) : super(key: key);

  @override
  State<ProfileWishList> createState() => _ProfileWishListState();
}

class _ProfileWishListState extends State<ProfileWishList> {
  @override
  void initState() {
    final provider = Provider.of<ProfileProvider>(context, listen: false);
    provider.getWishList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          title: const Text('Wishlist'),
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(FluentIcons.cart_20_regular),
            )
          ],
          // create search text field in the app bar
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[100]!,
                      width: 1.0,
                    )
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              height: kToolbarHeight,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.bottom,
                maxLines: 1,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  hintText: 'Search wishlist...',
                  prefixIcon: const Icon(Icons.search, color: AppColors.greyLighter),
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.grey[200]!)),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Consumer<ProfileProvider>(
          builder: (context,state,__) {
            return state.wishlist?.data != null ? AnimatedList(
              initialItemCount: state.wishlist?.data?.length ?? 0,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index, animation) => WishListCard(wishlist: state.wishlist?.data?[index],animation: animation,),
            ) : ShimmerLoading().buildShimmerContent();
          }
        ),
    );
  }
}