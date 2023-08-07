import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uis/CommonWidget/common_icon.dart';
import 'package:uis/Model/Response/history_response_model.dart' as history;
import 'package:uis/PreferenceManager/prefrence_manager.dart';
import 'package:uis/View/pageview_screen.dart';
import 'package:uis/ViewModel/history_view_model.dart';

import '../../ApiServices/api_response.dart';
import '../../constant/TextStyle_helper.dart';
import '../../constant/color_helper.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  GetHistoryViewModel getHistoryViewModel = Get.put(GetHistoryViewModel());

  @override
  void initState() {
    getHistoryViewModel.getHistoryViewModel(PrefrenceManager.getUserId());
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetHistoryViewModel>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.COMPLETE) {

            history.HistoryResponseModel data=controller.apiResponse.data;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 30,
                            right: 13,
                          ),
                          child: CommonIcon(
                              icon: Icons.arrow_back_ios,
                              onpress: () {
                                Get.back();
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 70),
                          child: Text(
                            "History",
                            style: TextStyleHelper.sblackpoly26
                                .copyWith(fontSize: 22.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(

                      height: 20.h,
                    ),
                    SizedBox(
                      height: 400.h,
                      child: ListView.builder(itemCount:data.data.length,shrinkWrap: true,itemBuilder: (context, index) {
                        return  Column(children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              height: 58.h,
                              width: 388.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey.shade400,
                                        offset: Offset(1, 1))
                                  ]),
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    "${data.data[index].deceasedName}",
                                    style: TextStyleHelper.sgreypoly12
                                        .copyWith(color: Colors.black, fontSize: 14),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Date of Death:",
                                        style: TextStyleHelper.sgreypoly12
                                            .copyWith(fontSize: 12),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${data.data[index].dateOfDeath.year}",
                                            style: TextStyleHelper.sgreypoly12.copyWith(
                                                fontSize: 12, color: Colors.black),
                                          ),
                                          Text(
                                            "-${data.data[index].dateOfDeath.month}",
                                            style: TextStyleHelper.sgreypoly12.copyWith(
                                                fontSize: 12, color: Colors.black),
                                          ),
                                          Text(
                                            "-${data.data[index].dateOfDeath.day}",
                                            style: TextStyleHelper.sgreypoly12.copyWith(
                                                fontSize: 12, color: Colors.black),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                                trailing: GestureDetector(
                                    onTap: () {
                                      Get.to(PageViewScreen(formId: data.data[index].id.toString(),));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 15),
                                      child: Container(
                                          height: 35.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: ColorHelper.sblue),
                                          child: Center(
                                              child: Text(
                                                "View Details",
                                                style: TextStyleHelper.swhitepoly20
                                                    .copyWith(fontSize: 14.sp),
                                              ))),
                                    )),
                              ))
                        ]);
                      },),
                    )
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
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ));

  }
}
