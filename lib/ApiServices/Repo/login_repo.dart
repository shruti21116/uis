import 'package:uis/ApiServices/ApiRoutes/api_routes.dart';
import 'package:uis/ApiServices/api_handlers.dart';
import 'package:uis/Model/Response/login_responsemodel.dart';


class GetUserLoginRepo
{

  static Future<LoginResponseModel> getUserLogin(Map<String,dynamic> bodydata)async{

    var response=await ApiService().getResponse(apiType: APIType.aPost, url:ApiRoutes.login,body: bodydata);

    LoginResponseModel loginResponseModel=LoginResponseModel.fromJson(response);
    return loginResponseModel;

  }
}