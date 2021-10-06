import 'package:flutter/material.dart';

import '../colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title, fontFamily;
  final Alignment alignment;
  final double elevation,
      fonSize,
      paddingHorizontal,
      paddingVertical,
      marginHorizontal,
      marginVertical,
      borderRadius;
  final Widget? child;
  final Color textColor, backgroundColor, borderColor;

  CustomButton({
    required this.onPressed,
    this.title,
    this.alignment = Alignment.center,
    this.backgroundColor = CustomColors.primaryColor,
    this.elevation = 0,
    this.child,
    this.paddingHorizontal = 20,
    this.paddingVertical = 10,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    this.textColor = CustomColors.whiteColor,
    this.fonSize = 20,
    this.fontFamily = 'alfa',
    this.borderColor = Colors.transparent,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: marginHorizontal, vertical: marginVertical),
      child: OutlinedButton(
        onPressed: onPressed,
        child: child ??
            Text(
              title ?? '',
              style: theme.textTheme.headline1?.copyWith(
                fontSize: fonSize.sp,
                color: textColor,
                fontFamily: fontFamily,
              ),
            ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: paddingVertical,
          ),
          side: BorderSide(color: borderColor),
          backgroundColor: backgroundColor,
          elevation: elevation,
          alignment: alignment,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
      ),
    );
  }
}
