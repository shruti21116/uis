import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uis/ApiServices/Repo/single_form_repo.dart';
import 'package:uis/ApiServices/api_response.dart';

import 'package:uis/Model/Response/single_form_response_model.dart';

class GetSingleFormViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;

  ApiResponse _apiResponseUpdateForm =
      ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponseUpdateForm => _apiResponseUpdateForm;

  TextEditingController date_of_death = TextEditingController();
  TextEditingController deases_name = TextEditingController();
  TextEditingController place_of_death = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController date_attech = TextEditingController();
  TextEditingController printed = TextEditingController();
  TextEditingController signature = TextEditingController();
  TextEditingController printed2 = TextEditingController();
  TextEditingController signature2 = TextEditingController();
  TextEditingController date_of_death2 = TextEditingController();
  TextEditingController printed_2 = TextEditingController();
  TextEditingController signature_2 = TextEditingController();
  TextEditingController date_of_death_2 = TextEditingController();
  TextEditingController Relationship = TextEditingController();
  TextEditingController printed_3 = TextEditingController();
  TextEditingController signature_3 = TextEditingController();
  TextEditingController date_of_death3 = TextEditingController();
  TextEditingController Relationship3 = TextEditingController();
  TextEditingController printed3 = TextEditingController();
  TextEditingController signature3 = TextEditingController();
  TextEditingController date_of_death_3 = TextEditingController();

  Future<void> getSingleFormViewModel(String userid, String formId) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');

    update();
    try {
      SingleFormResponseModel response =
          await GetSingleForm.getSingleForm(userid, formId);
      _apiResponse = ApiResponse.complete(response);

      deases_name.text = response.data.deceasedName;
      place_of_death.text = response.data.placeOfDeath;
      date_attech.text = response.data.dateTimeAttached.toString();
      number.text = response.data.numberOnUisBand;
      date_of_death2.text = response.data.dateOfDeath.toString();
      date_of_death_2.text = response.data.dateOfDeath.toString();
      date_of_death3.text = response.data.dateOfDeath.toString();
      date_of_death.text = response.data.dateOfDeath.toString();

      date_of_death_3.text = response.data.dateOfDeath.toString();

      log('SingleFormResponseModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());

      log('SingleFormResponseModel-------->>>>>>$e');
    }
    update();
  }
}
