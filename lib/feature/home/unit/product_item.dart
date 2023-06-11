import 'package:barcode_task/constants.dart';
import 'package:barcode_task/core/model/product_model.dart';
import 'package:barcode_task/widgets/main_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final ProductModel model;

  const ProductItem({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  MainText(
                    text: 'Product name: ',
                    font: 15.sp,
                    weight: FontWeight.bold,
                  ),
                  MainText(
                    text: model.title,
                    color: kPrimaryColor,
                    font: 15.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 4.h,),
              Row(
                children: [
                  MainText(
                    text: 'Storage number: ',
                    font: 15.sp,
                    weight: FontWeight.bold,
                  ),
                  MainText(
                    text: model.storageNumber,
                    color: kPrimaryColor,
                    font: 15.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 4.h,),

              Row(
                children: [
                  MainText(
                    text: 'Quantity: ',
                    font: 15.sp,
                    weight: FontWeight.bold,
                  ),
                  MainText(
                    text: model.quantity.toString(),
                    color: kPrimaryColor,
                    font: 15.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 4.h,),

              Row(
                children: [
                  MainText(
                    text: 'Barcode: ',
                    font: 15.sp,
                    weight: FontWeight.bold,
                  ),
                  MainText(
                    text: model.barcode,
                    color: kPrimaryColor,
                    font: 15.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              )
            ],
          ),
        ),
        MainText(
          text: model.counter.toString(),
          color: kPrimaryColor,
          font: 15.sp,
          weight: FontWeight.bold,
        )
      ],
    );
  }
}
