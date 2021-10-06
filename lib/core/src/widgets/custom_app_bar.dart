import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import '../colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? endIcon;
  final String centerTitle;
  final Color iconsColor, backgroundColor;

  CustomAppBar({
    required this.centerTitle,
    this.endIcon,
    this.iconsColor = CustomColors.primaryColor,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: SizedBox(
            width: .08.sw,
            height: .08.sh,
            child: endIcon,
          ),
        )
      ],
      leading: InkWell(
        onTap: () => Get.back(),
        child: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: iconsColor,
        ),
      ),
      shadowColor: Colors.transparent,
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(
        centerTitle,
        style: textTheme.headline1?.copyWith(
          color: CustomColors.primaryColor,
          fontSize: 24,
        ),
      ),
    );
  }
}
