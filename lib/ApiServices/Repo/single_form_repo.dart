import 'package:uis/ApiServices/ApiRoutes/api_routes.dart';
import 'package:uis/ApiServices/api_handlers.dart';
import 'package:uis/Model/Response/single_form_response_model.dart';

class GetSingleForm{


  static Future<SingleFormResponseModel> getSingleForm(String userid,String formId) async {

    var response=await ApiService().getResponse(apiType: APIType.aGet, url:'${ApiRoutes.singleform}/$userid/$formId');

    SingleFormResponseModel singleFormResponseModel=SingleFormResponseModel.fromJson(response);

    return singleFormResponseModel;

  }
}