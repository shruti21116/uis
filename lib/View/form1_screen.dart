import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uis/ApiServices/api_response.dart';
import 'package:uis/CommonWidget/common_button.dart';
import 'package:uis/CommonWidget/common_icon.dart';
import 'package:uis/CommonWidget/common_textfied.dart';
import 'package:uis/Model/Response/single_form_response_model.dart';
import 'package:uis/PreferenceManager/prefrence_manager.dart';
import 'package:uis/ViewModel/pageview_controller.dart';
import 'package:uis/View/form2_screen.dart';
import 'package:uis/ViewModel/single_form_view_model.dart';
import 'package:uis/constant/TextStyle_helper.dart';
import 'package:uis/constant/color_helper.dart';

class Form1Screen extends StatefulWidget {
  const Form1Screen({Key? key}) : super(key: key);

  @override
  State<Form1Screen> createState() => _Form1ScreenState();
}

class _Form1ScreenState extends State<Form1Screen> {
  PageViewController pageViewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: GetBuilder<GetSingleFormViewModel>(
            builder: (controller) {

              return Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  CommonTextfield(
                    hint: "Name of the Deceased",
                    controller: controller.deases_name,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonTextfield(
                    controller:controller.date_of_death,
                    hint: "Date of Death",
                    suffixicon: CommonIcon(
                      icon: Icons.calendar_month_outlined,
                      color: Colors.grey.shade700,
                      onpress: () async {
                        DateTime? current = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));

                        if (current != null) {
                          print(current);
                          String formattedDate =
                          DateFormat('dd-MM-yyyy').format(current);
                          print(formattedDate);
                          setState(() {
                            controller.date_of_death.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonTextfield(
                    hint: "Place of Death",
                    controller: controller.place_of_death,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonTextfield(
                    hint: "Number on the UIS Bracelet",
                    controller: controller.number,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonTextfield(
                    controller: controller.date_attech,
                    hint: "Date/Time Attached",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Name of Person Securing the UIS on the Deceased \n(Place the Bracelet on the ankle of the deceased)",
                    style: TextStyleHelper.sblackpoly26.copyWith(fontSize: 14.7.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CommonTextfield(
                    controller: controller.printed,
                    hint: "Printed",
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  CommonTextfield(
                    hint: "Signature",
                    controller: controller.signature,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 240),
                    child: CommonButton(
                      height: 50.h,
                      width: 100.w,
                      text: Text("Next", style: TextStyleHelper.swhitepoly20),
                      onpress: () {
                        pageViewController.Nextpage();
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
