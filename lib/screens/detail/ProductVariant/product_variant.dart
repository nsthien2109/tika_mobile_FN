// ignore_for_file: prefer_is_empty, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tika_store/configs/styles.dart';
import 'package:tika_store/configs/theme.dart';
import 'package:tika_store/models/variant.dart';

class ProductVariant extends StatelessWidget {
  List<DataSize>? sizes;
  List<DataColor>? colors;
  DataSize? selectedSize;
  DataColor? selectedColor;
  Function(DataSize index) onChangeSize;
  Function(DataColor index) onChangeColor;
  ProductVariant(
      {Key? key,
      this.sizes,
      this.colors,
      this.selectedSize,
      this.selectedColor,
      required this.onChangeSize,
      required this.onChangeColor
      }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Variant', style: AppStyle.sectionTitle),
          const SizedBox(
            height: 16,
          ),
          (sizes!= null && sizes!.length > 0)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Size : ',
                            style: TextStyle(
                                color: AppColors.black, fontSize: 14)),
                        Text("${selectedSize?.sizeName}",
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Wrap(
                      children: List.generate(sizes!.length, (index) {
                        return radioSize(sizes![index]);
                      }),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 16),
          (colors != null && colors!.length > 0)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Color : ',
                            style: TextStyle(
                                color: AppColors.black, fontSize: 14)),
                        Text("${selectedColor?.colorName}",
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Wrap(
                      children: List.generate(colors!.length, (index) {
                        return radioColor(colors![index]);
                      }),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget radioSize(size) {
    return GestureDetector(
      onTap: () => onChangeSize(size),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        margin: const EdgeInsets.only(right: 8, top: 8),
        decoration: BoxDecoration(
            color: selectedSize?.idSize == size.idSize ? AppColors.primary : Colors.white,
            border: Border.all(
              width: 1, 
              color: selectedSize?.idSize == size.idSize ? AppColors.yellow : Colors.grey[300]!
            ),
            borderRadius: const BorderRadius.all(
                Radius.circular(10) //         <--- border radius here
              )
            ),
        child:
            Text(
              size.sizeName, 
              style: TextStyle(color: selectedSize?.idSize == size.idSize ? AppColors.white : AppColors.black)
            ),
      ),
    );
  }

  Widget radioColor(color) {
    return GestureDetector(
      onTap: () => onChangeColor(color),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        margin: const EdgeInsets.only(right: 8, top: 8),
        decoration: BoxDecoration(
            color: selectedColor?.idColor == color.idColor ? AppColors.primary : Colors.white,
            border: Border.all(
              width: 1, 
              color: selectedColor?.idColor == color.idColor ? AppColors.yellow : Colors.grey[300]!,
            ),
            borderRadius: const BorderRadius.all(
                Radius.circular(10) //         <--- border radius here
              )
            ),
        child: Text(color.colorName, style: TextStyle(color: selectedColor?.idColor == color.idColor ? AppColors.white : AppColors.black)),
      ),
    );
  }
}
