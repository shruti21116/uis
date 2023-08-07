import 'package:uis/ApiServices/ApiRoutes/api_routes.dart';
import 'package:uis/ApiServices/api_handlers.dart';
import 'package:uis/Model/Response/register_responsemodel.dart';

class GetUserRegister{


   static Future<RegisterResponseModel> getUserRegister(Map<String,dynamic> bodydata) async {

   var response=await ApiService().getResponse(apiType: APIType.aPost, url:ApiRoutes.register,body: bodydata);

   RegisterResponseModel registerResponseModel=RegisterResponseModel.fromJson(response);

    return registerResponseModel;

  }
}