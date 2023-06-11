import 'dart:developer';

import 'package:barcode_task/constants.dart';
import 'package:barcode_task/core/provider/main_provider.dart';
import 'package:barcode_task/feature/home/unit/product_item.dart';
import 'package:barcode_task/widgets/customButton.dart';
import 'package:barcode_task/widgets/customScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../core/model/product_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;
  bool show = true;
  String barcode = '';

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.get(context);
    return CustomScaffold(
        body: Column(
      children: [
        show
            ? Expanded(
                child: QRView(
                  key: _qrKey,
                  onQRViewCreated: (QRViewController controller) async {
                    _controller = controller;
                    controller.resumeCamera();
                    controller.scannedDataStream
                        .listen((Barcode barCode) async {
                      if (barCode.code != null || barCode.code!.isNotEmpty) {
                        barcode = barCode.code!;
                      }
                    });
                  },
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 8,
                    borderLength: 0,
                    borderWidth: 0,
                    overlayColor: Colors.white,
                    cutOutHeight: 225.h,
                    cutOutWidth: 225.h,
                  ),
                ),
              )
            : Container(),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: ListView.separated(
                        itemCount: app.product.length,
                        itemBuilder: (BuildContext context, int i) =>
                            ProductItem(model: app.product[i]),
                        separatorBuilder: (BuildContext context, int i) =>
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Divider(),
                            ))),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          show = !show;
                        });
                      },
                      child: Image.asset(
                        getAsset('camera_icon'),
                        height: 30.h,
                        width: 30.h,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: CustomButton(
                        title: 'Scan',
                        onPressed: () {
                          if (barcode.isNotEmpty) {
                            if (app.product.any((e) => e.barcode == barcode)) {
                              app.increase(app.product
                                  .where((e) => e.barcode == barcode)
                                  .toList()[0]);
                            } else {
                              app.addProduct(ProductModel(barcode: barcode));
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
