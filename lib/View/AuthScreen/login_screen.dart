import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uis/ApiServices/Repo/login_repo.dart';
import 'package:uis/ApiServices/api_response.dart';
import 'package:uis/Model/Response/check_user_response_model.dart';
import 'package:uis/Model/Response/login_responsemodel.dart';
import 'package:uis/PreferenceManager/prefrence_manager.dart';
import 'package:uis/View/bottmnavigationbar_screen.dart';
import 'package:uis/ViewModel/login_view_model.dart';

import 'package:uis/constant/TextStyle_helper.dart';
import 'package:uis/constant/image_path.dart';

import '../../CommonWidget/common_button.dart';
import '../../CommonWidget/common_textfied.dart';
import '../forgot_password.dart';
import 'register_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController psw = TextEditingController();

  GetLoginViewModel getLoginViewModel = Get.put(GetLoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: GetBuilder<GetLoginViewModel>(
          builder: (controller) {
            if (controller.apiResponse.status == Status.COMPLETE ||
                controller.apiResponse.status == Status.INITIAL) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 118.sp, bottom: 56.sp),
                          child: Image.asset(ImagePath.img),
                        ),
                        Text("Login", style: TextStyleHelper.sorangepoly16),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Welcome back!",
                          style: TextStyleHelper.sbluepoly26,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CommonTextfield(
                          controller: email,
                          hint: "Enter your email",
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CommonTextfield(
                          controller: psw,
                          hint: "Enter your Password",
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: TextButton(
                              onPressed: () {
                                Get.to(ForgotPassword());
                              },
                              child: Text(
                                "Forgot password?",
                                style: TextStyleHelper.sgreypoly12,
                              )),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CommonButton(
                          text: Text(
                            "Login",
                            style: TextStyleHelper.swhitepoly20,
                          ),
                          onpress: () async {
                            Map<String, dynamic> bodydata = {
                              "email": email.text,
                              "password": psw.text
                            };

                            await getLoginViewModel.getLoginViewModel(bodydata);

                            if (controller.apiResponse.status ==
                                Status.COMPLETE) {
                              LoginResponseModel data =
                                  controller.apiResponse.data;

                              if (data.status == "success") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('${data.message}')));

                                await getLoginViewModel.getUserStatusViewModel(
                                    data.data!.userId.toString());

                                if (controller
                                        .apiResponseCheckUserStatus.status ==
                                    Status.COMPLETE) {
                                  CheckUserResponseModel data1 = controller
                                      .apiResponseCheckUserStatus.data;

                                  if (data.status == "success") {
                                    print('1-------${data.status}');
                                    if (data1.data?.status == "approved") {
                                      print('2-------${data1.data?.status}');
                                      Get.to(BottomNavigationBarScreen());
                                      PrefrenceManager.addUserid(
                                          data.data!.userId.toString());
                                    } else {
                                      print('3-----${data1.data?.status}');
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return  Dialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                            child: Container(
                                              height: 407.h,
                                              width: 332.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 230),
                                                    child: IconButton(
                                                      icon:
                                                      Icon(Icons.clear),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 60),
                                                    child: Text(
                                                      "Please wait until\n"
                                                          "  admin approve\n "
                                                          "   your profile",
                                                      style: TextStyleHelper
                                                          .sblackpoly26,
                                                    ),
                                                  ),
                                                  SizedBox(height: 24.h,),

                                                  CommonButton(
                                                    onpress: () {
                                                      Get.back();
                                                    },
                                                    text: Text("OK",
                                                        style: TextStyleHelper
                                                            .swhitepoly20),
                                                    height: 56.h,
                                                    width: 121.w,
                                                  ),

                                                ],
                                              ),
                                            ),);
                                        },
                                      );
                                    }
                                  }
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('${data.message}')));
                              }
                            }
                          },
                          height: 58.h,
                          width: 388.w,
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyleHelper.sgreypoly12,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(RegisterPage());
                                },
                                child: Text(
                                  "Register Now",
                                  style: TextStyleHelper.sbluepoly26
                                      .copyWith(fontSize: 12.sp),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (controller.apiResponse.status == Status.LOADING) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.apiResponse.status == Status.ERROR) {
              return Center(
                child: Text('${controller.apiResponse.message}'),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ));
  }
}
