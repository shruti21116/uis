import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:uis/CommonWidget/common_icon.dart';
import 'package:uis/constant/TextStyle_helper.dart';
import 'package:uis/constant/color_helper.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                        right: 13,
                      ),
                      child: CommonIcon(
                          icon: Icons.arrow_back_ios,
                          onpress: () {
                            Get.back();
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 50),
                      child: Text(
                        "Notifications",
                        style: TextStyleHelper.sblackpoly26
                            .copyWith(fontSize: 22.sp),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: List.generate(
                      10,
                      (index) => Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                height: 58.h,
                                width: 388.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                          color: Colors.grey.shade400,
                                          offset: Offset(1, 1))
                                    ]),
                               child: ListTile(
                                 title: Padding(
                                   padding: const EdgeInsets.only(bottom: 10),
                                   child: Text(
                                     "Lorem Ipsum is simply dummy text of the ext of the ext of the ",
                                     style: TextStyleHelper.sgreypoly12,
                                   ),
                                 ),
                                 leading:GestureDetector(
                                   onTap: () {},
                                   child: Padding(
                                     padding: const EdgeInsets.only(bottom: 8),
                                     child: Container(
                                       height: 45.h,
                                       width: 45.w,
                                       decoration: BoxDecoration(
                                           borderRadius:
                                           BorderRadius.circular(5),
                                           color: ColorHelper.sblue),
                                       child: Icon(Icons.notifications_none,
                                           color: Colors.white, size: 33.sp),
                                     ),
                                   )) ,
                                 trailing:
                                   Padding(
                                     padding: const EdgeInsets.only(bottom: 23),
                                     child: Text(
                                       "2 min",
                                       style: TextStyleHelper.sgreypoly12.copyWith(fontSize: 12.sp),
                                     ),
                                   ),
                              )
                          )]),
                )
                )],
            ),
          ),
        ),
      ),
    );
  }
}
