import 'package:flutter/material.dart';
import 'package:tika_store/configs/theme.dart';

class OrderListCard extends StatelessWidget {
  const OrderListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Card(
        elevation: 1,
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: const Text("Pendding", style: TextStyle(
                    color: AppColors.primary, fontSize: 12
                )
              ),
            ),
            const Divider(
              height: 0,
              color: AppColors.greyLighter,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: const Text("21-09-2022", style: TextStyle(
                  fontSize:12, color: AppColors.greyLighter
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: const Text("#ORD1", style: TextStyle(
                  fontSize:14, fontWeight: FontWeight.w500
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(8)),
                      //child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: orderListData[index].image)
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Text(
                     "Ao khoac kaki",
                     maxLines: 3,
                     overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}