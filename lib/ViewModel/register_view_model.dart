import 'dart:developer';

import 'package:get/get.dart';

import 'package:uis/ApiServices/Repo/register_repo.dart';
import 'package:uis/ApiServices/api_response.dart';
import 'package:uis/Model/Response/register_responsemodel.dart';

class GetRegisterViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;

  Future<void> getRegisterViewModel(Map<String, dynamic> body) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      RegisterResponseModel response =
          await GetUserRegister.getUserRegister(body);
      _apiResponse = ApiResponse.complete(response);
      log('RegisterResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('RegisterResponseModel-------->>>>>>$e');
    }
    update();
  }
}
