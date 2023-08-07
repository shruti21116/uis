import 'package:uis/ApiServices/ApiRoutes/api_routes.dart';
import 'package:uis/ApiServices/api_handlers.dart';
import 'package:uis/Model/Response/country_response_model.dart';

class GetCountryRepo{


  static Future< CountryResponseModel> getCountry()async{


    var response=await ApiService().getResponse(apiType: APIType.aGet, url: ApiRoutes.country);
    CountryResponseModel countryResponseModel=CountryResponseModel.fromJson(response);

    return countryResponseModel;

  }
}