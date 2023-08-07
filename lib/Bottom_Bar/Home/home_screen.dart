import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uis/constant/TextStyle_helper.dart';

import '../../constant/image_path.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(
                      width: 135.w,
                    ),
                    Center(
                        child: Container(
                            height: 34.h,
                            width: 64.w,
                            child: Image.asset(
                              ImagePath.img,
                              fit: BoxFit.cover,
                            ))),
                  ],
                ),
                Center(
                  child: Container(
                    height: 350.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/qrcode.png"),
                            fit: BoxFit.fill)),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Notice",
                  style: TextStyleHelper.sblackpoly26.copyWith(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    height: 58.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 1,
                              color: Colors.grey.shade400,
                              offset: Offset(1, 1))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14,top: 15),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the",
                        style: TextStyleHelper.sgreypoly12,
                      ),
                    )),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                    height: 58.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 1,
                              color: Colors.grey.shade400,
                              offset: Offset(1, 1))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14,top: 15),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the",
                        style: TextStyleHelper.sgreypoly12,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
