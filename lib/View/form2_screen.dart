import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uis/CommonWidget/common_button.dart';
import 'package:uis/CommonWidget/common_icon.dart';
import 'package:uis/CommonWidget/common_textfied.dart';
import 'package:uis/View/form1_screen.dart';
import 'package:uis/View/form3_screen.dart';
import 'package:uis/ViewModel/single_form_view_model.dart';
import 'package:uis/constant/TextStyle_helper.dart';
import 'package:uis/constant/color_helper.dart';

import '../ViewModel/pageview_controller.dart';

class Form2Screen extends StatefulWidget {
  const Form2Screen({Key? key}) : super(key: key);

  @override
  State<Form2Screen> createState() => _Form2ScreenState();
}

class _Form2ScreenState extends State<Form2Screen> {

  DateFormat formattedDate = DateFormat('dd-MM-yyyy');
  DateTime current = DateTime.now();

  PageViewController pageViewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<GetSingleFormViewModel>(
            builder: (controller) {
              return Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "Name of Funeral/Other Representative Taking Custody of the Deceased",
                    style: TextStyleHelper.sblackpoly26.copyWith(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CommonTextfield(
                    hint: "Printed",
                    controller: controller.printed2,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonTextfield(
                    hint: "Signature",controller: controller.signature2,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonTextfield(
                    controller: controller.date_of_death2,
                    hint: "Date/Time",
                    suffixicon: CommonIcon(
                        icon: Icons.calendar_month_outlined,
                        color: Colors.grey.shade700,
                        onpress: () async {
                          await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100))
                              .then((value) => controller.date_of_death2.text =
                              formattedDate.format(value!).toString());
                        }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Name of Funeral/Other Representative Taking Custody of the Deceased",
                    style: TextStyleHelper.sblackpoly26.copyWith(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CommonTextfield(
                    hint: "Printed",
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonTextfield(
                    hint: "Signature",
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonTextfield(
                    controller: controller.date_of_death_2,
                    hint: "Date/Time",
                    suffixicon: CommonIcon(
                        icon: Icons.calendar_month_outlined,
                        color: Colors.grey.shade700,
                        onpress: () async {
                          await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100))
                              .then((value) => controller.date_of_death_2.text =
                              formattedDate.format(value!).toString());
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: GestureDetector(
                          onTap: () {
                            pageViewController.priviospage();
                          },
                          child: Container(
                            height: 50.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorHelper.sblue,
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text("Pervious",
                                    style: TextStyleHelper.sbluepoly26
                                        .copyWith(fontSize: 17))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 90,
                        ),
                        child: CommonButton(
                          height: 50.h,
                          width: 100.w,
                          text: Text("Next", style: TextStyleHelper.swhitepoly20),
                          onpress: () {
                            pageViewController.Nextpage();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
