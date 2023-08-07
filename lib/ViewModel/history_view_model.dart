import 'dart:developer';

import 'package:get/get.dart';
import 'package:uis/ApiServices/Repo/history_repo.dart';
import 'package:uis/ApiServices/api_response.dart';
import 'package:uis/Model/Response/history_response_model.dart';


class GetHistoryViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;

  Future<void> getHistoryViewModel(String userid) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      HistoryResponseModel response =
      await GetHistory.getHistory(userid);
      _apiResponse = ApiResponse.complete(response);
      log('HistoryResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('HistoryResponseModel-------->>>>>>$e');
    }
    update();
  }
}
