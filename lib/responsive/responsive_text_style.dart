import 'package:flutter/cupertino.dart';

class ResponsiveTextStyles

on BuildContext
{

TextStyle get responsiveDisplayLarge =>
    AppTextStyle.displayStyle.copyWith(fontSize:ResponsiveHelper.getFontSize(
      this,
      mobile:40,
      tablet:48,
      desktop:57,
    ),);
}