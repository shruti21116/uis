import 'package:uis/ApiServices/ApiRoutes/api_routes.dart';
import 'package:uis/ApiServices/api_handlers.dart';
import 'package:uis/Model/Response/state_response_model.dart';

class GetStateRepo{


  static Future< StateResponseModel> getState(String Id)async{


    var response=await ApiService().getResponse(apiType: APIType.aGet, url: "${ApiRoutes.state}/$Id");
    StateResponseModel stateResponseModel=StateResponseModel.fromJson(response);

    return stateResponseModel;

  }
}