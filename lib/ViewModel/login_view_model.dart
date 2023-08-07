import 'dart:developer';
import 'package:get/get.dart';
import 'package:uis/ApiServices/Repo/check_user_status_repo.dart';
import 'package:uis/ApiServices/Repo/login_repo.dart';
import 'package:uis/ApiServices/api_response.dart';
import 'package:uis/Model/Response/check_user_response_model.dart';
import 'package:uis/Model/Response/login_responsemodel.dart';


class GetLoginViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;


  ApiResponse _apiResponseCheckUserStatus = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponseCheckUserStatus => _apiResponseCheckUserStatus;

  Future<void> getLoginViewModel(Map<String,dynamic> body) async {

    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      LoginResponseModel response= await GetUserLoginRepo.getUserLogin(body);
      _apiResponse = ApiResponse.complete(response);
      log('LoginResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('LoginResponseModel-------->>>>>>$e');
    }
    update();
  }


  Future<void> getUserStatusViewModel(String userid) async {

    _apiResponseCheckUserStatus = ApiResponse.loading(message: 'Loading');
    update();
    try {
      CheckUserResponseModel response= await GetUserStatusRepo.getUserStaus(userid);
      _apiResponseCheckUserStatus = ApiResponse.complete(response);
      log('CheckUserResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponseCheckUserStatus = ApiResponse.error(message: e.toString());

      log('CheckUserResponseModel-------->>>>>>$e');
    }
    update();
  }
}
