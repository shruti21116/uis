import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis/constant/color_helper.dart';

class CommonButton extends StatefulWidget {
  const CommonButton(
      {Key? key, this.text, this.onpress, this.height, this.width})
      : super(key: key);
  final text;
  final onpress;
  final height;
  final width;


  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onpress,
      height: widget.height,
      minWidth: widget.width,
      color: ColorHelper.sblue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.sp)),
      child: widget.text
    );
  }
}
