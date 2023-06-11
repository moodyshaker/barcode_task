import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';
import '../../core/router/router.dart';
import '../core/provider/main_provider.dart';
import 'action_dialog.dart';
import 'main_text.dart';

class CustomScaffold extends StatefulWidget {
  final String? title;
  final bool hasAppbar;
  final Widget body;
  final Color? backgroundColor;

  final Function()? onBackPressed;

  const CustomScaffold(
      {this.title,
      required this.body,
      this.backgroundColor,
      this.hasAppbar = true,
      this.onBackPressed,
      Key? key})
      : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    final cubit = AppProvider.get(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WillPopScope(
        onWillPop: () async {
          if (!MagicRouter.canPop && widget.onBackPressed == null) {
            showDialog(
                context: navigatorKey.currentContext!,
                builder: (c) => ActionDialog(
                      content: 'Do you want to exit ?',
                      onCancelClick: () {
                        MagicRouter.pop();
                      },
                      approveAction: 'Yes',
                      cancelAction: 'No',
                      onApproveClick: () {
                        MagicRouter.pop();
                        SystemNavigator.pop();
                      },
                    ));
          } else {
            widget.onBackPressed != null
                ? widget.onBackPressed!()
                : MagicRouter.pop();
          }
          return false;
        },
        child: Scaffold(
          backgroundColor: widget.backgroundColor ?? kWhiteColor,
          appBar: widget.hasAppbar
              ? AppBar(
                  title: MainText(
                    text: widget.title ?? '',
                    color: kBlackColor,
                    font: 24.sp,
                    weight: FontWeight.w600,
                  ),
                  toolbarHeight: 70.h,
                  leading: IconButton(
                      onPressed: () {
                        if (!MagicRouter.canPop &&
                            widget.onBackPressed == null) {
                          showDialog(
                              context: navigatorKey.currentContext!,
                              builder: (c) => ActionDialog(
                                    content: 'Do you want to exit ?',
                                    onCancelClick: () {
                                      MagicRouter.pop();
                                    },
                                    approveAction: 'Yes',
                                    cancelAction: 'No',
                                    onApproveClick: () {
                                      MagicRouter.pop();
                                      SystemNavigator.pop();
                                    },
                                  ));
                        } else {
                          widget.onBackPressed != null
                              ? widget.onBackPressed!()
                              : MagicRouter.pop();
                        }
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: kBlackColor,
                      )),
                  elevation: 0.0,
                  centerTitle: true,
                  backgroundColor: kWhiteColor)
              : null,
          body: SafeArea(child: widget.body),
        ),
      ),
    );
  }
}
