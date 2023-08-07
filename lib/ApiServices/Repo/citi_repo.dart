import 'package:uis/ApiServices/ApiRoutes/api_routes.dart';
import 'package:uis/ApiServices/api_handlers.dart';
import 'package:uis/Model/Response/cities_response_model.dart';

class GetCitiesRepo{

  static Future<CitiesResponseModel> getCities(String stateId,String Id)async {
    var response = await ApiService().getResponse(
        apiType: APIType.aGet, url: "${ApiRoutes.cities}/$Id/$stateId");
    CitiesResponseModel citiesResponseModel = CitiesResponseModel.fromJson(
        response);

    return citiesResponseModel;
  }
}