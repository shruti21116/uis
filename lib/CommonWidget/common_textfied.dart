

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis/constant/TextStyle_helper.dart';
import 'package:uis/constant/color_helper.dart';

class CommonTextfield extends StatefulWidget {
  const CommonTextfield({Key? key, this.suffixicon, this.hint, this.controller, this.onTap}) : super(key: key);

  final suffixicon;
  final hint;
  final controller;
  final onTap;


  @override
  State<CommonTextfield> createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: Colors.black,
      cursorHeight: 20,
      clipBehavior: Clip.none,autocorrect: true,
      onTap:widget.onTap ,
      style: TextStyleHelper.sgreypoly12.copyWith(fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: widget.hint,

        hintStyle: TextStyleHelper.sgreypoly12.copyWith(fontSize: 14.sp),
          suffixIcon: widget.suffixicon,
          fillColor:ColorHelper.stextfieldcolor,
          filled: true,

          constraints: BoxConstraints.expand(height: 56.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey.shade400,width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey.shade400,width: 1.w))),

    );
  }
}
