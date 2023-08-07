import 'dart:developer';

import 'package:get/get.dart';
import 'package:uis/ApiServices/Repo/country_repo.dart';
import 'package:uis/ApiServices/Repo/state_repo.dart';
import 'package:uis/ApiServices/api_response.dart';
import 'package:uis/Model/Response/country_response_model.dart';

import '../Model/Response/state_response_model.dart';


class GetCountryViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;

  ApiResponse _apistateResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apistateResponse => _apistateResponse;

  Future<void> getCountryViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      CountryResponseModel response =
      await GetCountryRepo.getCountry();
      _apiResponse = ApiResponse.complete(response);
      log('CountryResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('CountryResponseModel-------->>>>>>$e');
    }
    update();
  }

  Future<void> getStateViewModel(String Id) async {
    _apistateResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      StateResponseModel response=await GetStateRepo.getState(Id);
      _apistateResponse = ApiResponse.complete(response);
      log('StateResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apistateResponse = ApiResponse.error(message: e.toString());

      log('StateResponseModel-------->>>>>>$e');
    }
    update();
  }
}
