
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';
import 'package:uis/ApiServices/api_response.dart';
import 'package:uis/CommonWidget/common_button.dart';
import 'package:uis/CommonWidget/common_icon.dart';
import 'package:uis/CommonWidget/common_textfied.dart';
import 'package:uis/View/bottmnavigationbar_screen.dart';
import 'package:uis/ViewModel/pageview_controller.dart';
import 'package:uis/ViewModel/single_form_view_model.dart';
import 'package:uis/constant/TextStyle_helper.dart';
import 'package:uis/constant/color_helper.dart';

class Form3screen extends StatefulWidget {
  const Form3screen({Key? key}) : super(key: key);

  @override
  State<Form3screen> createState() => _Form3screenState();
}

class _Form3screenState extends State<Form3screen> {
  PageViewController pageViewController = Get.find();

  GetSingleFormViewModel getSingleFormViewModel = Get.find();

  DateFormat formattedDate = DateFormat('dd-MM-yyyy');
  DateTime current = DateTime.now();

  ImagePicker picker=ImagePicker();

  File? image;
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<GetSingleFormViewModel>(
            builder: (controller) {
              if (controller.apiResponse.status == Status.COMPLETE) {
                // UpdateFormResponseModel data =
                //     controller.apiResponseUpdateForm.data;
                return Column(
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Name of person entitled to receive the cremated remalns",
                      style: TextStyleHelper.sblackpoly26
                          .copyWith(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CommonTextfield(
                      hint: "Printed",
                      controller: controller.printed3,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CommonTextfield(
                      hint: "Relationship",
                      controller: controller.Relationship3,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CommonTextfield(
                      hint: "Signature",
                      controller: controller.signature3,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CommonTextfield(
                      controller: controller.date_of_death3,
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
                                .then((value) => controller
                                        .date_of_death3.text =
                                    formattedDate.format(value!).toString());
                          }),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      "Name of person releasing cremated remains",
                      style: TextStyleHelper.sblackpoly26
                          .copyWith(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CommonTextfield(
                      hint: "Printed",
                      controller: controller.printed_3,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CommonTextfield(
                      hint: "Signature",
                      controller: controller.signature_3,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CommonTextfield(
                      controller: controller.date_of_death_3,
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
                              .then((value) {
                            controller.date_of_death_3.text =
                                formattedDate.format(value!).toString();
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 235),
                      child: Text(
                        "Upload Photo",
                        style: TextStyleHelper.sblackpoly26
                            .copyWith(fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Container(
                      width: 385.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(5),
                          color: ColorHelper.sGrey.withOpacity(0.2)),
                      child: GestureDetector(
                        onTap: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(type: FileType.image,);

                          if (result != null) {
                            file = File(result.files.single.path!);
                            setState(() {});
                            print('FILE ${file}');
                          } else {
                            print('User canceled the picker');
                          }
                        },

                        child: Padding(
                          padding: const EdgeInsets.only(right: 220),
                          child: Center(
                            child: Container(
                              height: 33.h,
                              width: 88.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorHelper.sGrey.withOpacity(0.2)),
                              child: Center(
                                  child: Text(
                                "Choose file",
                                style: TextStyleHelper.sgreypoly12,
                              )),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    file == null ? Text('No Image') : Image.file(file!),
                    Padding(
                      padding: const EdgeInsets.only(right: 230, top: 30),
                      child: MaterialButton(
                          elevation: 20,
                          color: Colors.white,
                          onPressed: ()
                            async {
                              XFile? file = await picker
                                  .pickImage(
                                  source:
                                  ImageSource
                                      .camera);
                              image = File(
                                  file!.path);
                              setState(() {});
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  child: Container(
                                    height: 380.h,
                                    width: 320.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 177.h,
                                          width: 271.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey.shade300,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Image.asset(
                                              "assets/images/signature.png"),
                                        ),
                                        SizedBox(
                                          height: 26.h,
                                        ),
                                        CommonButton(
                                          onpress: () {},
                                          text: Text("Save",
                                              style:
                                                  TextStyleHelper.swhitepoly20),
                                          height: 56.h,
                                          width: 121.w,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        MaterialButton(
                                            onPressed: (){},

                                            elevation: 20,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5.sp)),
                                            color: Colors.white,
                                            child: Text(
                                              "Redo",
                                              style: TextStyleHelper.sbluepoly26
                                                  .copyWith(fontSize: 16.h),
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            "Esign",
                            style: TextStyleHelper.sbluepoly26
                                .copyWith(fontSize: 16.h),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
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
                            top: 35,
                          ),
                          child: CommonButton(
                            height: 50.h,
                            width: 100.w,
                            text: Text("Submit",
                                style: TextStyleHelper.swhitepoly20),

                            onpress:(){

                              Get.to(BottomNavigationBarScreen());
                            } ,
                            // onpress: () async {
                            //
                            //   Map<String, dynamic> bodydata = {
                            //     "deceased_name": controller.deases_name.text,
                            //     "date_of_death": controller.date_of_death.text,
                            //     "place_of_death":
                            //         controller.place_of_death.text,
                            //     "phone_number": controller.number.text,
                            //     "date_time_attached":
                            //         controller.date_attech.text,
                            //     "picture_of_number_on_band":
                            //         controller.signature.text,
                            //   };
                            //
                            //   await getSingleFormViewModel.updateFormViewModel(
                            //       bodydata,
                            //       data.status,
                            //       data.data!.formId.toString());
                            //
                            //   if (data.status == "success") {
                            //
                            //     print('1------->${data.status}');
                            //     Get.to(BottomNavigationBarScreen());
                            //   } else {
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //         SnackBar(content: Text("${data.message}")));
                            //   }
                            // },
                          ),
                        ),
                      ],
                    ),
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
          ),
        ),
      ),
    );
  }
}
