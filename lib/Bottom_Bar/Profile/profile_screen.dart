import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uis/ApiServices/api_response.dart';
import 'package:uis/CommonWidget/common_button.dart';
import 'package:uis/CommonWidget/common_icon.dart';
import 'package:uis/CommonWidget/common_textfied.dart';
import 'package:uis/Model/Response/profile_response_model.dart';
import 'package:uis/Model/Response/update_profile_response_model.dart';
import 'package:uis/PreferenceManager/prefrence_manager.dart';
import 'package:uis/View/bottmnavigationbar_screen.dart';
import 'package:uis/ViewModel/profile_view_model.dart';
import 'package:uis/constant/TextStyle_helper.dart';
import 'package:uis/constant/color_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GetProfileViewModel getProfileViewModel = Get.put(GetProfileViewModel());

  @override
  void initState() {
    getProfileViewModel.getProfileViewModel(PrefrenceManager.getUserId());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: GetBuilder<GetProfileViewModel>(
          builder: (controller) {
            if (controller.apiResponse.status == Status.COMPLETE) {
             // UpdateProfileResponseModel data =
               //   controller.apiResponseProfile.data;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 25,
                            right: 13,
                          ),
                          child: CommonIcon(
                              icon: Icons.arrow_back_ios,
                              onpress: () {
                                Get.back();
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 25, left: 50),
                          child: Text(
                            "My Profile",
                            style: TextStyleHelper.sblackpoly26
                                .copyWith(fontSize: 22.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage("assets/images/Ellipse.png"),
                            ),
                            Positioned(
                              top: 63,
                              left: 63,
                              child: CircleAvatar(
                                backgroundColor: ColorHelper.sblue,
                                radius: 18,
                                child: Icon(Icons.edit,
                                    color: Colors.white, size: 20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 53.h,
                        ),
                        CommonTextfield(
                          controller: controller.name,
                          hint: "Enter your name",
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        CommonTextfield(
                          controller: controller.email,
                          hint: "Enter your email",
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        CommonTextfield(
                          controller: controller.phone,
                          hint: "Enter your Phone Number",
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        CommonTextfield(
                          controller: controller.location,
                          hint: "Enter your Location",
                        ),
                        SizedBox(
                          height: 117.h,
                        ),
                        CommonButton(
                          // onpress: () async {
                          //   Map<String, dynamic> bodydata = {
                          //     "name": controller.name.text,
                          //     "email": controller.email.text,
                          //     "phone": controller.phone.text,
                          //     "location": controller.location.text,
                          //   };
                          //
                          //   await getProfileViewModel.updateProfileViewModel(
                          //       PrefrenceManager.getUserId(),
                          //       data.data!.formId.toString(),
                          //       bodydata);
                          //
                          //   if (data.status == "success") {
                          //     print("====>updated successfully");
                          //     Get.to(BottomNavigationBarScreen());
                          //   }
                          // },
                          height: 56.h,
                          width: double.infinity,
                          text: Text(
                            "Save",
                            style: TextStyleHelper.swhitepoly20,
                          ),
                        )
                      ],
                    ),
                  )
                ],
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
        )),
      ),
    );
  }
}
