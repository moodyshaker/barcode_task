import 'package:barcode_task/core/router/router.dart';
import 'package:barcode_task/widgets/action_dialog.dart';
import 'package:flutter/material.dart';

class ProductModel{
  final String title = 'Juice';
  final String storageNumber = '953251485';
  final String barcode;
  final int quantity = 5;
  int counter = 1;

  ProductModel({required this.barcode});

}
