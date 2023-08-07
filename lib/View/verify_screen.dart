import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uis/CommonWidget/common_button.dart';

import 'package:uis/CommonWidget/common_icon.dart';
import 'package:uis/constant/TextStyle_helper.dart';
import 'package:uis/constant/color_helper.dart';

import 'update_password.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key, this.mobile}) : super(key: key);

  final mobile;

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25, left: 8),
                    child: CommonIcon(
                        icon: Icons.arrow_back_ios,
                        onpress: () {
                          Get.back();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 50),
                    child: Text(
                      "Verifying Number",
                      style: TextStyleHelper.sblackpoly26
                          .copyWith(fontSize: 22.sp),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 37.h,
                    ),
                    Text(
                      "We sent an otp to your mobile number ${widget.mobile}",
                      style:
                          TextStyleHelper.sgreypoly12.copyWith(fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    OtpTextField(
                      fieldWidth: 55.w,
                      numberOfFields: 6,
                      borderColor: ColorHelper.sblue,
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      borderWidth: 1,
                      showFieldAsBox: true,
                      onSubmit: (String value) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content: Text("Code entered is $value"),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not yet get?",
                          style: TextStyleHelper.sblackpoly26
                              .copyWith(fontSize: 15.sp),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "Resend OTP",
                              style: TextStyleHelper.sbluepoly26
                                  .copyWith(fontSize: 15.sp),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 98.h,
                    ),
                    CommonButton(
                      height: 58.h,
                      width: double.infinity,
                      onpress: () {
                        Get.to(UpdatePassword());
                      },
                      text: Text(
                        "Verify",
                        style: TextStyleHelper.swhitepoly20,
                      ),
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
