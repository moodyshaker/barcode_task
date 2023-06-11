import 'dart:developer';
import 'package:barcode_task/constants.dart';
import 'package:barcode_task/core/model/product_model.dart';
import 'package:barcode_task/feature/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/provider/main_provider.dart';
import 'core/router/router.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: kWhiteColor,
        statusBarIconBrightness: Brightness.dark));
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext ctx, Widget? child) => MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => AppProvider()),
              ],
              child: Builder(
                builder: (BuildContext c) => MaterialApp(
                  title: 'Barcode Task',
                  debugShowCheckedModeBanner: false,
                  navigatorKey: navigatorKey,
                  builder: (context, child) => Directionality(
                    child: child!,
                    textDirection: TextDirection.ltr,
                  ),
                  home: Home(),
                ),
              ),
            ));
  }
}
