import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tika_store/configs/responsive.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/providers/auth_provider.dart';
import 'package:tika_store/screens/cart/CartItem/cart_item.dart';
import 'package:tika_store/widgets/button/tika_button.dart';
import 'package:tika_store/widgets/shimmer/shimmer_loading.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_,state,__) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            centerTitle: false,
            title: const Text("Shopping Cart"),
          ),
          body: state.cartList.data != null ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        children: List.generate(
                          state.cartList.data?.length ?? 0,
                          (index){
                            return CartItem(
                              cartItem: state.cartList.data![index],
                              onAddQuantity: ()=> state.addQuantity(state.cartList.data![index]),
                              onRemoveQuantity: ()=> state.minusQuantity(state.cartList.data![index]),
                            );
                          }
                        ),
                      ),
                    ),
                    SizedBox(height: widthP(context)/2)
                  ],
                ) : ShimmerLoading().buildShimmerContent(),
            bottomSheet: Card(
              elevation: 3,
              child: SizedBox(
                width: widthP(context),
                height: widthP(context) /2.3,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 60,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            TextFormField(
                              decoration:  InputDecoration(
                                filled: true,
                                fillColor: Colors.black12,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: AppColors.white, width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: AppColors.white),
                                ),
                                hintText: "Enter coupon code ...",
                                hintStyle: const TextStyle(
                                  color: AppColors.blackLighter, 
                                ),                         
                              ),
                            ),
                            Positioned(
                              right: 2,
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: const Icon(FluentIcons.check_20_regular, size: 26,color: AppColors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total", style: TextStyle(
                                  fontSize: 15, 
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              Text("\$ ${state.totalCart}", style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w600
                                )
                              )
                            ],
                          ),
                          TikaButton(
                            label: "Checkout", 
                            width: 100,
                            height: 50,
                            onTap: (){}
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        );
      }
    );
  }
}