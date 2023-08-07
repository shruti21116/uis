import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uis/CommonWidget/common_button.dart';
import 'package:uis/CommonWidget/common_icon.dart';
import 'package:uis/CommonWidget/common_textfied.dart';
import 'package:uis/View/verify_screen.dart';
import 'package:uis/constant/TextStyle_helper.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController mobileno =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25,left: 8),
                    child: CommonIcon(
                        icon: Icons.arrow_back_ios,
                        onpress: () {
                          Get.back();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 55),
                    child: Text(
                      "Forgot Password",
                      style: TextStyleHelper.sblackpoly26
                          .copyWith(fontSize: 22.sp),
                    ),
                  ),


                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35.h,
                    ),
                    Text(
                      "Enter your email or phone number & will send you instruction on hoe to reset it.",
                      style: TextStyleHelper.sgreypoly12.copyWith(fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Email",
                        style:
                        TextStyleHelper.sblackpoly26.copyWith(fontSize: 16.sp)),
                    SizedBox(
                      height: 30.h,
                    ),
                    CommonTextfield(
                      hint: "Enter your email",
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                        child: Text("or",
                            style: TextStyleHelper.sgreypoly12
                                .copyWith(fontSize: 16.sp))),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text("Mobile Number",
                        style:
                        TextStyleHelper.sblackpoly26.copyWith(fontSize: 16.sp)),
                    SizedBox(
                      height: 15.h,
                    ),
                    CommonTextfield(controller: mobileno,
                      hint: "Enter your mobile",
                    ),
                    SizedBox(
                      height: 75.h,
                    ),
                    CommonButton(
                      height: 58.h,
                      width: double.infinity,
                      text: Text(
                        "Sent",
                        style: TextStyleHelper.swhitepoly20,
                      ),
                      onpress: () {
                        Get.to(VerifyScreen(mobile:mobileno.text));
                      },
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
