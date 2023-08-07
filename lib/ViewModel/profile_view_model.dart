import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uis/ApiServices/Repo/profile_repo.dart';
import 'package:uis/ApiServices/Repo/update_profile_repo.dart';

import 'package:uis/ApiServices/api_response.dart';
import 'package:uis/Model/Response/profile_response_model.dart';
import 'package:uis/Model/Response/update_profile_response_model.dart';

class GetProfileViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;


  ApiResponse _apiResponseProfile = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponseProfile => _apiResponseProfile;

  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController location=TextEditingController();

  Future<void> getProfileViewModel(String userid) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');

    update();
    try {
      ProfileResponseModel response =
          await GetProfileRepo.getProfileRepo(userid);
      _apiResponse = ApiResponse.complete(response);


      name.text=response.data!.name;
      email.text=response.data!.email;
      phone.text=response.data!.phone.toString();
      location.text=response.data!.location;

      log('ProfileResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('ProfileResponseModel-------->>>>>>$e');
    }
    update();
  }


  Future<void> updateProfileViewModel(String userid,String formId,Map<String,dynamic> body) async {
    _apiResponseProfile = ApiResponse.loading(message: 'Loading');
    update();
    try {
      UpdateProfileResponseModel response=await UpdateProfileRepo.updateProfileRepo(userid, formId,body);
      _apiResponseProfile = ApiResponse.complete(response);

      log('ProfileResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponseProfile = ApiResponse.error(message: e.toString());

      log('ProfileResponseModel-------->>>>>>$e');
    }
    update();
  }

}
