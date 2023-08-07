import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uis/ApiServices/api_response.dart';

import 'package:uis/CommonWidget/common_icon.dart';
import 'package:uis/Model/Response/single_form_response_model.dart';
import 'package:uis/PreferenceManager/prefrence_manager.dart';
import 'package:uis/ViewModel/pageview_controller.dart';
import 'package:uis/View/form1_screen.dart';
import 'package:uis/View/form2_screen.dart';
import 'package:uis/View/form3_screen.dart';
import 'package:uis/ViewModel/single_form_view_model.dart';

import 'package:uis/constant/TextStyle_helper.dart';
import 'package:uis/constant/color_helper.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key, required this.formId}) : super(key: key);

  final String formId;

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;

  PageViewController pageViewController = Get.find();

  GetSingleFormViewModel getSingleFormViewModel =
      Get.put(GetSingleFormViewModel());

  @override
  void initState() {
    getSingleFormViewModel.getSingleFormViewModel(
        PrefrenceManager.getUserId(), widget.formId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<GetSingleFormViewModel>(builder: (controller) {
          if (controller.apiResponse.status == Status.COMPLETE) {
            SingleFormResponseModel data = controller.apiResponse.data;
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 8),
                          child: CommonIcon(
                              icon: Icons.arrow_back_ios,
                              onpress: () {
                                Get.back();
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 105),
                          child: Text(
                            "Form",
                            style: TextStyleHelper.sblackpoly26
                                .copyWith(fontSize: 22.sp),
                          ),
                        ),
                        selectedPage == 2
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 100),
                                child: Container(
                                  height: 37.h,
                                  width: 37.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: ColorHelper.sblue,
                                  ),
                                  child: Icon(
                                    Icons.print,
                                    color: Colors.white,
                                    size: 24.sp,
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              3,
                              (index) => Expanded(
                                    child: Container(
                                      height: 2.5.h,
                                      width: 388.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: selectedPage + 1 > index
                                            ? ColorHelper.sblue
                                            : ColorHelper.sGrey
                                                .withOpacity(0.5),
                                      ),
                                      margin: EdgeInsets.all(3),
                                    ),
                                  ))),
                    ),
                    SizedBox(
                      height: 790.h,
                      child: GetBuilder<PageViewController>(
                        builder: (controller) {
                          return PageView(
                            controller: pageViewController.pagecontroller,
                            onPageChanged: (value) {
                              selectedPage = value;
                              setState(() {});
                            },
                            children: [
                              Form1Screen(),
                              Form2Screen(),
                              Form3screen(),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
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
            return Center(
              child: Text('${controller.apiResponse.status}'),
            );
          }
        }));
  }
}
