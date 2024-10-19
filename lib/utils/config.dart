import 'package:flutter/material.dart';

class Config{
  static MediaQueryData? mediaQueryData;
  static double? screenwidth;
  static double? screenheight;

  void init(BuildContext context){
    mediaQueryData=MediaQuery.of(context);
    screenwidth=mediaQueryData!.size.width;
    screenheight=mediaQueryData!.size.height;
  }

  static get widthSize{
    return screenwidth;
  }
  static get heightSize{
    return screenheight;
  }
  static const spaceSmall=SizedBox(height: 25);
  static final spaceMedium =SizedBox(height: screenheight!*0.05);
  static final spaceBig =SizedBox(height: screenheight!*0.08);

  static const outlineBorder=OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8))
  );

  static const focusBorder=OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.greenAccent
    ),
  );

  static const errorBorder=OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
  borderSide: BorderSide(
  color: Colors.redAccent
  ),);

  static const primaryColor=Colors.greenAccent;

}