import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uis/CommonWidget/common_button.dart';
import 'package:uis/CommonWidget/common_icon.dart';
import 'package:uis/CommonWidget/common_textfied.dart';
import 'package:uis/View/AuthScreen/login_screen.dart';
import 'package:uis/constant/TextStyle_helper.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
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
                      "New Password",
                      style: TextStyleHelper.sblackpoly26
                          .copyWith(fontSize: 22.sp),
                    ),
                  ),


                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [  SizedBox(
                    height: 37.h,
                  ),
                    Text(
                      "Set your new password",style: TextStyleHelper.sgreypoly12.copyWith(fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 27.h,
                    ),],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    SizedBox(height: 28.h,),
                    const CommonTextfield(
                      hint: "Enter your Password",
                    ),
                    SizedBox(height: 19.h,),
                    const CommonTextfield(
                      hint: "Enter your confirm password",
                    ),
                    SizedBox(height: 103.h,),
                    CommonButton(
                      height: 58.h,
                      width: double.infinity,
                      onpress: () {
                       Get.to(LoginPage());
                      },
                      text: Text(
                        "Set Password",
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
