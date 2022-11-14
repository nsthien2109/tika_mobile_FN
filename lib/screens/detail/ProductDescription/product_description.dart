// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/theme.dart';

class ProductDescription extends StatelessWidget {
  String description;
  ProductDescription({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Description',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 16,
            ),
            Text(description, maxLines: 3, overflow: TextOverflow.ellipsis,),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDescriptionPage(name: widget.name, image: widget.image)));
              },
              child: const Center(
                child: Text('Read More',
                    style: TextStyle(color: AppColors.primary)),
              ),
            ),
          ],
        ));
  }
}
