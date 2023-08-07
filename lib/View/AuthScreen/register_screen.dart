import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uis/ApiServices/api_response.dart';
import 'package:uis/Model/Response/register_responsemodel.dart';
import 'package:uis/PreferenceManager/prefrence_manager.dart';
import 'package:uis/View/bottmnavigationbar_screen.dart';
import 'package:uis/ViewModel/register_view_model.dart';

import 'package:uis/constant/image_path.dart';

import '../../CommonWidget/common_button.dart';
import '../../CommonWidget/common_textfied.dart';
import '../../constant/TextStyle_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController psw = TextEditingController();
  TextEditingController confirmpsw = TextEditingController();

  GetRegisterViewModel getRegisterViewModel = Get.put(GetRegisterViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: GetBuilder<GetRegisterViewModel>(
          builder: (controller) {
            if (controller.apiResponse.status == Status.COMPLETE ||
                controller.apiResponse.status == Status.INITIAL) {
              return SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 90, bottom: 30),
                            child: Image.asset(ImagePath.img),
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyleHelper.sbluepoly26,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CommonTextfield(
                            hint: "Enter your name",
                            controller: name,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonTextfield(
                            hint: "Enter your email",
                            controller: email,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonTextfield(
                            hint: "Enter your password",
                            controller: psw,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CommonTextfield(
                            hint: "Enter you confirm password",
                            controller: confirmpsw,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CommonButton(
                            text: Text(
                              "Sign up",
                              style: TextStyleHelper.swhitepoly20,
                            ),
                            onpress: () async {
                              Map<String, dynamic> bodydata = {
                                "name": name.text,
                                "email": email.text,
                                "password": psw.text,
                                "cpassword": confirmpsw.text
                              };

                              await getRegisterViewModel
                                  .getRegisterViewModel(bodydata);

                              if (controller.apiResponse.status ==
                                  Status.COMPLETE) {
                                RegisterResponseModel data =
                                    controller.apiResponse.data;

                                if (data.status == "success") {
                                  print('1-------${data.status}');
                                  if (data.data!.status == "approved") {
                                    print('2-------${data.status}');
                                    Get.to(BottomNavigationBarScreen());

                                  } else {
                                    print('3-----${data.data!.status}');
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
                                          ),
                                        );},
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('${data.message}')));
                                }
                              }
                            },
                            height: 58.h,
                            width: 388.w,
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyleHelper.sgreypoly12,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "Login Now",
                                    style: TextStyleHelper.sbluepoly26
                                        .copyWith(fontSize: 12),
                                  )),
                            ],
                          )
                        ],
                      )));
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
