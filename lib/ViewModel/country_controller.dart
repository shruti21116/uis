import 'package:get/get.dart';
import 'package:uis/ApiServices/Repo/citi_repo.dart';
import 'package:uis/ApiServices/Repo/country_repo.dart';
import 'package:uis/ApiServices/Repo/state_repo.dart';
import 'package:uis/Model/Response/cities_response_model.dart';
import 'package:uis/Model/Response/country_response_model.dart';
import 'package:uis/Model/Response/state_response_model.dart';

class CountryController extends GetxController {
  bool loading = false;
  CountryResponseModel? countryResponseModel;
  StateResponseModel? stateResponseModel;
  CitiesResponseModel? citiesResponseModel;


  String? selectedCountry,selectedState,selectedCountryId = "1",selectedStateId="1",selectedCities,
      selectedCitiesId;

  Future<void> getCountry() async {
    loading = true;
    countryResponseModel = await GetCountryRepo.getCountry();
    loading = false;
    update();
  }

  Future<void> getStates() async {
    loading = true;
    stateResponseModel = await GetStateRepo.getState(selectedCountryId!);
    loading = false;
    update();
  }

  Future<void> getCities() async {
    loading = true;
    citiesResponseModel = await GetCitiesRepo.getCities(selectedCountryId!,selectedStateId!);
    loading = false;
    update();


  }
}
